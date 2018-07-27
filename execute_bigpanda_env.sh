#!/usr/bin/python

import os
import wget
import time
import human_curl as hurl


class BigPandaEnv():

    def download_images(self):
        output_directory = '/public/images'
        url = 'https://s3.eu-central-1.amazonaws.com/devops-exercise/pandapics.tar.gz'
        try:
            wget.download(url, out=output_directory)
            print 
	    print 'Panda images downloaded successfuly.'
        except Exception as e:
            print(e)

    def execute_env(self):
        os.system('docker-compose up -d')

    def kill_env(self):
        os.system('docker-compose down')

    def wait_until_env_is_up(self):
        for counter in range(1, 10):
	    print 'Waiting to BigPanda services to start (' + str(counter) + 's)'
            time.sleep(1)

    def health_check(self):
        req = hurl.get('http://localhost:3000')
        print req
        if  req.status_code == 200:
            print 'Panda Environment has been start successfully.'
            exit(0)
        elif req.status_code == 500:
            print 'Panda Environment is Unavailable'
            self.kill_env()
            exit(2)


if __name__ == "__main__":

    bigp = BigPandaEnv()
    bigp.download_images()
    bigp.execute_env()
    bigp.wait_until_env_is_up()
    bigp.health_check()
