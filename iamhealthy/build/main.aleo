program iamhealthy.aleo;

struct HealthRecord:
    glucose as u8;
    triglycerides as u8;
    sbp as u8;
    dbp as u8;
    collection_date as u64;
    expiry_date as u64;

record PersonalHealthRecord:
    owner as address.private;
    current_health_record as HealthRecord.private;


function issue:
    input r0 as address.private;
    input r1 as HealthRecord.private;
    assert.eq self.caller aleo1tgd0qax3vq8hax7fhnvy3tmwekxzeeycm5lw2qtmkp6c9dudysqsa9wp82;
    cast r0 r1 into r2 as PersonalHealthRecord.record;
    output r2 as PersonalHealthRecord.record;


function prove:
    input r0 as PersonalHealthRecord.record;
    lt r0.current_health_record.glucose 6u8 into r1;
    lt r0.current_health_record.triglycerides 5u8 into r2;
    and r1 r2 into r3;
    lt r0.current_health_record.sbp 140u8 into r4;
    and r3 r4 into r5;
    lt r0.current_health_record.dbp 90u8 into r6;
    and r5 r6 into r7;
    output r7 as boolean.private;
