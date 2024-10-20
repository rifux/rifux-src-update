#!/usr/bin/bash

# Fething the repository
git clone -b fourteen/lineage https://github.com/rifux/android_device_xiaomi_socrates

# Going inside
cd android_device_xiaomi_socrates

# Updating Lineage
git checkout fourteen/lineage
git remote add los https://github.com/LineageOS/android_device_xiaomi_socrates
git fetch los
git reset --hard los/lineage-21
git am -3 ../patches_android_device_xiaomi_socrates/fourteen_lineage_patches/*
git push --force

# Updating Matrixx
# |- GApps
git checkout fourteen/matrixx/gapps
git reset --hard origin/fourteen/lineage
git am -3 ../patches_android_device_xiaomi_socrates/fourteen_matrixx_patches_gapps/*
git push --force
# |- Vanilla
git checkout fourteen/matrixx/vanilla
git reset --hard origin/fourteen/lineage
git am -3 ../patches_android_device_xiaomi_socrates/fourteen_matrixx_patches_vanilla/*
git push --force
# |- Vault
git checkout fourteen/matrixx/vault
git reset --hard origin/fourteen/matrixx/vanilla
#git am -3 ../patches_android_device_xiaomi_socrates/fourteen_matrixx_patches_vault/*
git push --force

# Going into parent
cd ..

# Removing local copy of the repository
rm -rf android_device_xiaomi_socrates