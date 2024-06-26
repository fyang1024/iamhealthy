# Quick Start

1. `cd iamhealthy`

2. `./run.sh`

You should see the following output

```
We will be playing the role of two parties.

The private key and address of the health authority.
private_key: APrivateKey1zkp56xKuEMXxx9s2kjGCzaqNmZEaKp3yafFhJhmKKBHQ3Qy
address: aleo1tgd0qax3vq8hax7fhnvy3tmwekxzeeycm5lw2qtmkp6c9dudysqsa9wp82

The private key and address of the health record owner.
private_key: APrivateKey1zkp7mDmMYnFaoHvPtqe2fzB9wfSfTE5893geEdo5hstMXnN
address: aleo1kuphty0zqpntuaxj3xq2cyy7p4e7wkyl0z46hc2glrvhwyk0vvrqvhutpr


Firstly the health authority issues a health record to the owner

echo '
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp56xKuEMXxx9s2kjGCzaqNmZEaKp3yafFhJhmKKBHQ3Qy
' > .env

leo run issue aleo1kuphty0zqpntuaxj3xq2cyy7p4e7wkyl0z46hc2glrvhwyk0vvrqvhutpr '{
              glucose: 5u8,
              triglycerides: 3u8,
              sbp: 120u8,
              dbp: 80u8,
              collection_date: 1719367257u64,
              expiry_date: 1750867257u64
        }'

       Leo ✅ Compiled 'iamhealthy.aleo' into Aleo instructions

⛓  Constraints

 •  'iamhealthy.aleo/issue' - 2,026 constraints (called 1 time)

➡️  Output

 • {
  owner: aleo1kuphty0zqpntuaxj3xq2cyy7p4e7wkyl0z46hc2glrvhwyk0vvrqvhutpr.private,
  current_health_record: {
    glucose: 5u8.private,
    triglycerides: 3u8.private,
    sbp: 120u8.private,
    dbp: 80u8.private,
    collection_date: 1719367257u64.private,
    expiry_date: 1750867257u64.private
  },
  _nonce: 4612362519168945616656733931856788190209937618496361402712251317735259161936group.public
}

       Leo ✅ Finished 'iamhealthy.aleo/issue' (in "/Users/yangf/VsCodeProjects/iamhealthy/iamhealthy/build")

Then the health health record owner proves that she/he is healthy

echo '
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp7mDmMYnFaoHvPtqe2fzB9wfSfTE5893geEdo5hstMXnN
' > .env

leo run prove '<OUTPUT_OF_THE_FIRST_FUNCTION_CALL>'
```

3. replace the input after `leo run prove`  of the following command line with the output of your command line output from step 2.
``` 
leo run prove "{
  owner: aleo1kuphty0zqpntuaxj3xq2cyy7p4e7wkyl0z46hc2glrvhwyk0vvrqvhutpr.private,
  current_health_record: {
    glucose: 5u8.private,
    triglycerides: 3u8.private,
    sbp: 120u8.private,
    dbp: 80u8.private,
    collection_date: 1719367257u64.private,
    expiry_date: 1750867257u64.private
  },
  _nonce: 4612362519168945616656733931856788190209937618496361402712251317735259161936group.public
}"
```

you should see something like

```
       Leo ✅ Compiled 'iamhealthy.aleo' into Aleo instructions

⛓  Constraints

 •  'iamhealthy.aleo/prove' - 43 constraints (called 1 time)

➡️  Output

 • true

       Leo ✅ Finished 'iamhealthy.aleo/prove' (in "/Users/yangf/VsCodeProjects/iamhealthy/iamhealthy/build")
```

