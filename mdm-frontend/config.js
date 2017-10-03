/**
 * Created by snadal on 17/05/16.
 */

var config = {};

config.PORT = 3001;
config.METADATA_FRONTEND_URL = "http://localhost:"+config.PORT+"/";
config.METADATA_DATA_LAYER_URL = "http://mdm-storage:8082/metadataStorage/";
config.ONTO_MATCH_MERGE_URL = "http://mdm-storage:8082/ontoMatchMerge/";
config.DEFAULT_NAMESPACE = "http://supersede/";

module.exports = config;