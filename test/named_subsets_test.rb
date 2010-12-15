require 'test_helper'

class NamedSubsetsTest < Test::Unit::TestCase

  class List < Set
    include MassAssignMore::NamedSubsets
  end

  setup do
    @included_key = 'first_name'
    @list = List[ @included_key ]
  end

  should "add sublists" do
    @list[:admin] = [ 'admin' ]

    assert @list[:admin].is_a?(List),       "Should convert sublist to parent list's class"
    assert @list[:admin].include?('admin'), "Should store the sublist's entries"
  end

  should "use with to include specified keys" do
    @list[:admin]     = [ 'admin'     ]
    @list[:moderator] = [ 'suspended' ]

    assert_equal Set[ @included_key, 'admin' ], @list.with(:admin), "Should combine with one sublist"
    assert_equal Set[ @included_key, 'admin', 'suspended'], @list.with(:admin, :moderator), "Should combine with many sublists"
    assert_equal @list.to_a, [ 'first_name' ], "with should not modify the original list"
  end

end
