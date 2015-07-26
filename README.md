SeeFusion Cookbook
===========================
Installs and configures SeeFusion for your environment.

Requirements
------------
You should have ColdFusion/Railo (or at least Tomcat if applicable) installed before running this recipe

Attributes
----------
#### seefusion::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <th colspan=4>Cookbook Configuration</th>
  </tr>
  <tr>
    <td><tt>['seefusion']['src']</tt></td>
    <td>String</td>
    <td>Location to download SeeFusion from</td>
    <td><tt>'https://seefusion.com/SeeFusion5.jar'</tt></td>
  </tr>
  <tr>
    <td><tt>['seefusion']['lib_dir']</tt></td>
    <td>String</td>
    <td>Location to download SeeFusion to</td>
    <td>(autodetect)</td>
  </tr>
  <tr>
    <td><tt>['seefusion']['config_dir']</tt></td>
    <td>String</td>
    <td>Location of servlet container config files</td>
    <td>(autodetect)</td>
  </tr>
  <tr>
    <th colspan=4>SeeFusion Configuration</th>
  </tr>
  <tr>
    <td><tt>['seefusion']['config']['enabled']</tt></td>
    <td>Boolean</td>
    <td>Enable SeeFusion? (does not affect UI)</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['seefusion']['config']['listeners']</tt></td>
    <td>String</td>
    <td>Space-delimited list of [ip]:[port]</td>
    <td><tt>all:8999</tt></td>
  </tr>
  <tr>
    <td><tt>['seefusion']['config']['password']</tt></td>
    <td>String</td>
    <td>Password for SeeFusion</td>
    <td>(blank = no password required)</td>
  </tr>
  <tr>
    <td><tt>['seefusion']['config']['name']</tt></td>
    <td>String</td>
    <td>Name for SeeFusion instance</td>
    <td><tt>Test</tt></td>
  </tr>
  <tr>
    <td><tt>['seefusion']['config']['displayRelativeTimes']</tt></td>
    <td>Boolean</td>
    <td>Display relative (instead of absolute) times?</td>
    <td><tt>false</tt></td>
  </tr>
</table>

```
default['seefusion']['config']['dbType'] = 'sqlserver'
default['seefusion']['config']['maxRequests'] = 20
default['seefusion']['config']['historySize'] = 10
default['seefusion']['config']['slowHistorySize'] = 10
default['seefusion']['config']['slowPageThreshold'] = 1000
default['seefusion']['config']['slowQueryThreshold'] = 100
default['seefusion']['config']['dashboardServers'] = '127.0.0.1'
default['seefusion']['config']['clickableURLs'] = false
default['seefusion']['config']['dbLogQueryExceptions'] = false
default['seefusion']['config']['dbLoggerEnabled'] = false
default['seefusion']['config']['httpPassword'] = ''
```

Usage
-----
#### seefusion::default
This will attempt to autodetect the version of ColdFusion, Railo, or just Tomcat installed,
then install and configure SeeFusion into that container.

#### seefusion::tomcat7
- ['seefusion']['lib_dir'] should point to tomcat's master `/lib` dir
- ['seefusion']['config_dir'] should point to the location of `server.xml`


Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x` based on `develop`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
License: http://www.apache.org/licenses/LICENSE-2.0
Author: Daryl Banttari
