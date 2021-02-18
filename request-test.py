import requests, os, time as _time, sys

auth=requests.auth.HTTPDigestAuth(
                username=os.environ['ATLAS_API_USERNAME'], password=os.environ['ATLAS_API_PASSWORD'])
                
                
base_url = 'https://cloud-dev.mongodb.com/api'

start_time = _time.time()
counter = 1
while _time.time() - start_time < 500:
    resp = requests.request('GET', '%s/atlas/v1.0/groups' % base_url, auth=auth)
    for project in resp.json()['results']:
        resp = requests.request('GET', '%s/atlas/v1.0/groups/%s/clusters' % (base_url, project['id']), auth=auth)
        for cluster in resp.json()['results']:
            cluster_again = requests.request('GET', '%s/atlas/v1.0/groups/%s/clusters/%s' % (base_url, project['id'], cluster['name']), auth=auth).json()
            #print('%s %s' % (cluster_again['name'], cluster_again['stateName']))
            sys.stdout.write('.')
            sys.stdout.flush()
            counter += 1
            if counter % 100 == 0:
                print()
                print(counter)
