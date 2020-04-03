#[macro_use]
extern crate rutie;
extern crate woothee;

use rutie::{Symbol, Boolean, RString, Class, Hash, Object};

use woothee::parser::Parser;

class!(FastWoothee);

methods!(
    FastWoothee,
    _itself,
    fn parse(ua_string: RString) -> Hash {
        let mut hash = Hash::new();

        let parser = Parser::new();
        match parser.parse(ua_string.unwrap_or(RString::new_usascii_unchecked("")).to_str()) {
            None => hash,
            Some(result) => {
                hash.store(Symbol::new("name"), RString::new_usascii_unchecked(&result.name));
                hash.store(Symbol::new("category"), RString::new_usascii_unchecked(&result.category));
                hash.store(Symbol::new("os"), RString::new_usascii_unchecked(&result.os));
                hash.store(Symbol::new("os_version"), RString::new_usascii_unchecked(&*result.os_version));
                hash.store(Symbol::new("browser_type"), RString::new_usascii_unchecked(&result.browser_type));
                hash.store(Symbol::new("version"), RString::new_usascii_unchecked(&*result.version));
                hash.store(Symbol::new("vendor"), RString::new_usascii_unchecked(&result.vendor));
                hash
            }
        }
    }
);

methods!(
    FastWoothee,
    _itself,
    fn is_crawler(ua_string: RString) -> Boolean {
        Boolean::new(woothee::is_crawler(ua_string.unwrap_or(RString::new_usascii_unchecked("")).to_str()))
    }
);

methods!(
    FastWoothee,
    _itself,
    fn is_ios(ua_string: RString) -> Boolean {
        let parser = Parser::new();

        match parser.parse(ua_string.unwrap_or(RString::new_usascii_unchecked("")).to_str()) {
            None => Boolean::new(false),
            Some(result) => {
                match result.os {
                    "iPod" => Boolean::new(true),
                    "iPad" => Boolean::new(true),
                    "iPhone" => Boolean::new(true),
                    "iOS" => Boolean::new(true),
                    _ => Boolean::new(false)
                }
            }
        }
    }
);

methods!(
    FastWoothee,
    _itself,
    fn is_android(ua_string: RString) -> Boolean {
        let parser = Parser::new();

        match parser.parse(ua_string.unwrap_or(RString::new_usascii_unchecked("")).to_str()) {
            None => Boolean::new(false),
            Some(result) => {
                match result.os {
                    "Android" => Boolean::new(true),
                    _ => Boolean::new(false)
                }
            }
        }
    }
);

#[no_mangle]
pub extern fn initialize_fast_woothee() {
    Class::new("FastWoothee", None).define(|itself| {
        itself.const_set("VERSION", &RString::new_usascii_unchecked("1.5.1").freeze());
        itself.def_self("parse", parse);
        itself.def_self("crawler?", is_crawler);
        itself.def_self("ios?", is_ios);
        itself.def_self("android?", is_android);
    });
}
