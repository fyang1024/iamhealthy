#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "
We will be playing the role of two parties.

The private key and address of the health authority.
private_key: APrivateKey1zkp56xKuEMXxx9s2kjGCzaqNmZEaKp3yafFhJhmKKBHQ3Qy
address: aleo1tgd0qax3vq8hax7fhnvy3tmwekxzeeycm5lw2qtmkp6c9dudysqsa9wp82

The private key and address of the health record owner.
private_key: APrivateKey1zkp7mDmMYnFaoHvPtqe2fzB9wfSfTE5893geEdo5hstMXnN
address: aleo1kuphty0zqpntuaxj3xq2cyy7p4e7wkyl0z46hc2glrvhwyk0vvrqvhutpr
"

echo "
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
"

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp56xKuEMXxx9s2kjGCzaqNmZEaKp3yafFhJhmKKBHQ3Qy
" > .env

leo run issue aleo1kuphty0zqpntuaxj3xq2cyy7p4e7wkyl0z46hc2glrvhwyk0vvrqvhutpr "{
              glucose: 5u8,
              triglycerides: 3u8,
              sbp: 120u8,
              dbp: 80u8,
              collection_date: 1719367257u64,
              expiry_date: 1750867257u64
        }"

echo "
Then the health health record owner proves that she/he is healthy

echo '
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp7mDmMYnFaoHvPtqe2fzB9wfSfTE5893geEdo5hstMXnN
' > .env

leo run prove '<OUTPUT_OF_THE_FIRST_FUNCTION_CALL>'
"

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp7mDmMYnFaoHvPtqe2fzB9wfSfTE5893geEdo5hstMXnN
" > .env
