#!/bin/sh

#     Copyright 2011 - Sardegna Ricerche, Distretto ICT, Pula, Italy
#   
#    Licensed under the EUPL, Version 1.1.
#    You may not use this work except in compliance with the Licence.
#    You may obtain a copy of the Licence at:
#   
#     http://www.osor.eu/eupl
#   
#    Unless required by applicable law or agreed to in  writing, software distributed under the Licence is distributed on an "AS IS" basis,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the Licence for the specific language governing permissions and limitations under the Licence.
#    In case of controversy the competent court is the Court of Cagliari (Italy).


#FILE=/tmp/mydb

FILE=${1}
NDB=0
DBNAME=locanda
BASEDIR=$(dirname $0)

usage(){
    app=`basename $0`
    echo "Usage: "
    echo "  - ${app} hsqlDataBaseFile [dataBaseName]";
    echo "  - ${app} stop";
    exit 1
}

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    usage;
fi

if [ $1 = "-h" -o $1 = "--h" -o $1 = "-help" -o $1 = "--help" ]; then
    usage;
fi


if [ $1 = "stop" ]; then

    java -jar ${BASEDIR}/lib/sqltool.jar --inlineRc=url=jdbc:hsqldb:hsql://localhost/locanda,user=SA,password="" --sql="SHUTDOWN;"
    exit 0
fi

if [ "$#" -eq 2 ]; then
    DBNAME=$2;
fi

echo java -cp ${BASEDIR}/hsqldb.jar org.hsqldb.server.Server --database.${NDB} file:${FILE} --dbname.${NDB} ${DBNAME}

java -cp ${BASEDIR}/lib/hsqldb.jar org.hsqldb.server.Server --database.${NDB} file:${FILE} --dbname.${NDB} ${DBNAME}

