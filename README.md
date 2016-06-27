# Temple University Libraries Oral History Collections

The Temple University Libraries

## Getting Started

### Prerequisites

Here are the basic steps to get TUL_Hydra up and running.

    git clone git@github.com:tulibraries/tul_ohist.git
    git submodule init
    git submodule update
    bundle install
    cp config/contentdm.yml.example config/contentdm.yml

Edit `config/contentdm.yml`. Replace samples with your ContentDM parameters

Complete the installation.

    rake db:migrate

    # The following step is missing from Hydra instructions.
    # Do it or you'll be reindexing whenever you restart jetty.
    rails generate hydra:jetty

    rake jetty:config
    rake jetty:start
    rails s -d

## Oral History Object Architecture

Oral history objects are a composite of two or more repository asset types in the
`digitalMetadata` datastream. These components consist of transcripts, and images,
and possibly audio files.

Each oral history object has a master identifier (MID).  Within the `digitalMetadata`
datastream are filenames for the transcript, photograph, and audio. Those files
are pulled from the filesystem and displayed or provided for playback in the object's
show page.

The assets that are unique to the oral history item usually are composed of the MID
with a three character suffix, (e.g. `Q01`).

The MID might be : AOHWMPJZ2014120022
The associated transcript_file would be AOHWMPJZ2014120022Q01.pdf

These files are located on a network server mounted at
`https://libdigital.temple.edu/pdfa1/Oral Histories/`, accessed with the
`local_file_url` helper method and rendered via the
[PDF_Object](https://github.com/pipwerks/PDFObject) viewer.

