require 'spec_helper'

describe 'mcmyadmin' do

    let :facts do
      {
        :osfamily => 'Debian',
        :operatingsystem => 'Ubuntu',
        :operatingsystemrelease => '12.04',
        :lsbdistrelease => '12.04',
        :lsbdistcodename => 'precise'
      }
    end

    it { should contain_user('minecraft') }
    it { should contain_group('minecraft') }

    it do should contain_file('/home/minecraft').with(
      'ensure' => 'directory',
      'owner'  => 'minecraft',
      'group'  => 'minecraft',
      'mode'   => '0755'
      )
    end

    it do should contain_file('/home/minecraft/McMyAdmin').with(
      'ensure' => 'directory'
      )
    end

    it { should contain_class('mcmyadmin::install') }

end