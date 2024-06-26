// The 'iamhealthy' program.
program iamhealthy.aleo {

    const HEALTH_AUTHORITY: address = aleo1tgd0qax3vq8hax7fhnvy3tmwekxzeeycm5lw2qtmkp6c9dudysqsa9wp82;

    struct HealthRecord {
        glucose: u8,
        triglycerides: u8,
        sbp: u8,
        dbp: u8,
        collection_date: u64,
        expiry_date: u64
    }

    record PersonalHealthRecord {
        owner: address,
        current_health_record: HealthRecord
    }

    transition issue(private owner: address, private health_record: HealthRecord) -> PersonalHealthRecord {
        assert_eq(self.caller, HEALTH_AUTHORITY);
        let personal_health_record : PersonalHealthRecord =  PersonalHealthRecord {
            owner: owner,
            current_health_record: health_record
        };
        return personal_health_record;
    }

    transition prove(private personal_health_record: PersonalHealthRecord) -> bool {
        return 
            personal_health_record.current_health_record.glucose < 6u8 && 
            personal_health_record.current_health_record.triglycerides < 5u8 &&
            personal_health_record.current_health_record.sbp < 140u8 &&
            personal_health_record.current_health_record.dbp < 90u8;
    }
}
