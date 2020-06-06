extern "C" {
    pub fn cc_value() -> ::std::os::raw::c_int;
}

pub fn value() -> i32 {
    unsafe { cc_value() }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn value_works() {
        assert_eq!(value(), 42);
    }
}
