#!/bin/bash

# Before running this script, be sure to grant execution permissions with the following command:
# chmod +x run.sh
# Script is used with the command ./run.sh

# Variables:
processor="ztautau" #ztautau /ttbar
executor="futures" 
year="2017"
nfiles="-1"
redirector="xcache"
tag="test_24_ZTauTau_m120_3prong" 

# Comparar V24 con V25
output_type="array"
syst="nominal"
lepton_flavor="tau"
channel="Ztautau"  # Ztautau / "1b2j1tau


# Samples:
samples=(
  "DYJetsToLL_M-10to50"
  "DYJetsToLL_M-50"
  "SingleTau"
  "DYJetsToLL_M-50_HT-70to100"
  "DYJetsToLL_M-50_HT-100to200"
  "DYJetsToLL_M-50_HT-200to400"
  "DYJetsToLL_M-50_HT-400to600"
  "DYJetsToLL_M-50_HT-600to800"
  "DYJetsToLL_M-50_HT-800to1200"
  "DYJetsToLL_M-50_HT-1200to2500"
  "DYJetsToLL_M-50_HT-2500toInf" 
  "ST_s-channel_4f_leptonDecays"
  "ST_t-channel_antitop_5f_InclusiveDecays"
  "ST_t-channel_top_5f_InclusiveDecays"
  "ST_tW_antitop_5f_inclusiveDecays"
  "ST_tW_top_5f_inclusiveDecays"
  "WJetsToLNu_HT-70To100"
  "WJetsToLNu_HT-100To200"
  "WJetsToLNu_HT-200To400"
  "WJetsToLNu_HT-400To600"
  "WJetsToLNu_HT-600To800"
  "WJetsToLNu_HT-800To1200"
  "WJetsToLNu_HT-1200To2500"
  "WJetsToLNu_HT-2500ToInf"
  "WW"
  "WZ"
  "ZZ"
  "TTToSemiLeptonic"
  "TTToHadronic"
  "TTTo2L2Nu" 
)

# For run over all the samples
for sample in "${samples[@]}"; do
  if [ "$sample" == "TTToSemiLeptonic" ]; then
  nsplit="15" # 15
  elif [ "$sample" == "TTToHadronic" ] || [ "$sample" == "TTTo2L2Nu" ] || [ "$sample" == "SingleTau" ]; then
    nsplit="10"# 10
  elif [ "$sample" == "DYJetsToLL_M-50_HT-2500toInf" ]; then
    nsplit="4"# 4
  elif [ "$sample" == "WJetsToLNu_HT-2500ToInf" ] || [ "$sample" == "ZZ" ]; then
    nsplit="2" # 3
  else
    nsplit="5" # 5
  fi
  
  if [ "$sample" == "DYJetsToLL_M-50" ]; then
  nsplit="5"
  fi

  python submit.py --processor "$processor" --channel "$channel" --lepton_flavor "$lepton_flavor" --executor "$executor" --year "$year" --nfiles "$nfiles" --redirector "$redirector" --tag "$tag" --output_type "$output_type" --syst "$syst" --sample "$sample" --nsplit "$nsplit"
done
