# encoding: utf-8

##################################################
# This script uses the opencage geocoding service
# it creates an output file with information coming from their platform
# To get credentials for the API visit https://developer.foursquare.com/docs/api/venues/search
##################################################
#
##################################################
# Author: Diego Pajarito
# Copyright: Copyright 2020, IAAC
# Credits: [Institute for Advanced Architecture of Catalonia - IAAC, Advanced Architecture group]
# License:  Apache License Version 2.0
# Version: 1.3.0
# Maintainer: Diego Pajarito
# Email: diego.pajarito@iaac.net
# Status: development
##################################################

# import all libraries
import json
import pandas as pd
import requests

# url taken by the Foursquare API developers page -> Places API -> Venues -> Search for venues
url = 'https://api.opencagedata.com/geocode/v1/json'
key = 'bef905ac2d914bb19cba534d4ea83b74'

# input_addresses. This JSON file is the output coming from the Scrapy spider
with open('./addresses/restaurants_bcn.json') as json_file:
    data = json.load(json_file)

addresses = pd.DataFrame.from_dict(data=data)

# We add three new columns to store main API outcomes
# addresses['address_formatted'] = ''
# addresses['lat'] = ''


for i in addresses.index:
    input_address = addresses['street'][i]
    params = dict(q=input_address, key=key)
    resp = requests.get(url=url, params=params)
    output = resp.json()
    if len(output['results']) > 0: # Use the codes
        # Print the raw response
        first_result = output['results'][0]
        addresses['address_formatted'] = first_result['formatted']
        addresses['lat'] = first_result['geometry']['lat']
        addresses['lon'] = first_result['geometry']['lng']
        print('Success: %s -- geocoded' % input_address)
    else:
        print('Error: %s -- not found' % input_address)


addresses.to_csv('geocoded_addresses.csv')
print('File Saved...')
