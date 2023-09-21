# Galaxy in GDI starter kit

This part of the starter kit setup demonstrates the use of Galaxy to process data files available over `htsget`.
A standalone Galaxy runs aside of the other components, in the expected trusted environment, there is no need to download the data elsewhere.

The data are accessed with a custom Galaxy tool, taking the file name and user's authorization token as inputs. Preferably, this download tool should be used as an initial step
of Galaxy workflow configured with `Output cleanup` flag on so that the sensitive file is deleted as soon as it is not needed anymore.
The risk of unintentional disclosure of the sensitive content is minimized in this way.
On the other hand, the setup does not prevent malicious user, once (s)he gets access to it, to download the data by intention; this was not the purporse.

## Running the service

1. start [starter-kit-storage-and-interfaces](https://github.com/GenomicDataInfrastructure/starter-kit-storage-and-interfaces) according to the instructions; _Demo_ mode will work out of the box, use of LS-AAI-mock of full LS AAI would require some tweaking
2. start [starter-kit-htsget](https://github.com/GenomicDataInfrastructure/starter-kit-htsget) according to the instructions on the same machine
3. run
```sh
docker-compose up -d
```
in a clone of this repo on the same machine; this step starts the Galaxy container and installs the custom tool `gdi_sk` from [test toolshed](https://testtoolshed.g2.bx.psu.edu/)

4. run
```sh
docker-compose restart galaxy
```
this is required for Galaxy to pick up the tool's dependencies (htsget client) correctly.

5. check Galaxy is running at http://localhost:8088/

In some cases, due to a not-well-understood race condition during Galaxy startup, the tool does not get installed correctly (and it's not available in the _Get Data_ menu). If this happens, running
```sh
docker compose down
docker compose up -d
```
again should fix the problem.

## Running the GDI starter kit download tool

1. Retrieve OICD bearer token; if the demo OIDC from starter-kit-storage-and-interfaces is running, run
```sh
curl -k -s -S https://localhost:8080/tokens | jq -r '.[0]' > token.txt
```
2. Upload `token.txt` to Galaxy at http://localhost:8088
3. Pick **GDI Starter Kit htsget** from the _Get Data_ menu
4. Select the uploaded `token.txt` as the token input
5. Fill in required filename, the suggested "EGAD74900000101/dummy_gdi.eu/NA12878.bam" can be used for demo purposes
6. Click on **Execute**; if everything works, the downloaded file appears in the current Galaxy history (on the right) in a while

## Using the GDI starter kit download in a workflow

TODO
