import os
import json

curdir = os.path.dirname(os.path.abspath(__file__))
project_settings = json.loads(open(os.path.join(curdir, '../../../.project_config.json'), 'r').read())['project_settings']

def get_env_variable(var_name):
    """ Get the environment variable or return an exception"""
    try:
        return os.environ[var_name]
    except KeyError:
        error_msg = "Set the %s environment variable" % var_name
        raise ImproperlyConfigured(error_msg)




def write_config(file_name='omop_harvest.logstash.conf')
    """ Write logstash config settings to logstash config file """
    environment = get_env_variable('APP_ENV')

    if environment not in project_settings.keys():
        error_msg = "Settings for {0} environment not found in project configuration.".format(environment)
        raise ImproperlyConfigured(error_msg)

    config = project_settings[environment]['logstash']['config']

    with open(os.path.join(curdir, file_name), 'w') as outfile:
      #Write the input
      outfile.write("{0} {1} {2} {3} {4}".format("input { file { ", config['input']['file1']['path'], config['input']['file1']['codec'], config['input']['file1']['start_position'],"}")  )
      outfile.write(" {0} {1} {2} {3} {4}".format("file { ", config['input']['file2']['path'], config['input']['file2']['codec'], config['input']['file2']['start_position'],"} }\n")  )
      #Write the filter
      outfile.write("{0} {1} {2}".format("filter { \n\tmultiline { ", config['filter']['multiline'],"}")  )
      outfile.write(" {0}".format("\n\tgrok { ") )
      outfile.write("\n\t\t{0}\n\t\t{1}\n\t\t{2}\n\t\t{3}\n\t\t{4}\n\t\t{5}".format(  config['filter']['grok']['matches']['match1'],
                                                        config['filter']['grok']['matches']['match2'],
                                                        config['filter']['grok']['matches']['match3'],
                                                        config['filter']['grok']['matches']['match4'],
                                                        config['filter']['grok']['matches']['match5'],
                                                        "}\n}\n"
                                              )  )
      #Write the output
      outfile.write("{0} {1} {2} ".format("output {", config['output'], " } ") )
      outfile.close()

write_config()
