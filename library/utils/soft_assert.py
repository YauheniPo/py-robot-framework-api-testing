from library.utils.common import Common


class SoftAssert(Common):
    """Class for soft assert"""

    def should_be_equal_as_strings(
            self,
            first,
            second,
            msg=None,
            values=True,
            ignore_case=False):
        """Check if strings equal.

        Args:
            first: actual string.
            second: expected string.
            msg: error message.
            ignore_case: is given a true value, it indicates that comparison should be case-insensitive.
        """

        self.built_in.run_keyword_and_continue_on_failure(
            'BuiltIn.Should Be Equal As Strings', first, second, msg, values, ignore_case)

    def should_not_be_true(self, expected, msg=None):
        """Check is not be true.

        Args:
            expected: expected value.
            msg: error message.
        """

        self.built_in.run_keyword_and_continue_on_failure(
            'BuiltIn.Should Not Be True', expected, msg
        )

    def should_be_true(self, expected, msg=None):
        """Check is be true.

        Args:
            expected: expected value.
            msg: error message.
        """

        self.built_in.run_keyword_and_continue_on_failure(
            'BuiltIn.Should Be True', bool(expected), msg
        )

    def should_contain(self, container, item, msg=None):
        """Check should contain.

        Args:
            container: element where check.
            item: element for check.
            msg: error message.
        """

        self.built_in.run_keyword_and_continue_on_failure(
            'BuiltIn.Should Contain', container, item, msg
        )

    def should_not_contain(self, container, item, msg=None):
        """Check should not contain.

        Args:
            container: element where check.
            item: element for check.
            msg: error message.
        """

        self.built_in.run_keyword_and_continue_on_failure(
            'BuiltIn.Should Not Contain', container, item, msg
        )

    def should_not_be_equal(
            self,
            first,
            second,
            msg=None,
            values=True,
            ignore_case=False):
        """Check equals.

        Args:
            first: actual value.
            second: expected value.
            msg: error message.
            ignore_case: is given a true value, it indicates that comparison should be case-insensitive.
        """

        self.built_in.run_keyword_and_continue_on_failure(
            'BuiltIn.Should Not Be Equal', first, second, msg, values, ignore_case)

    def should_be_equal_as_integers(self, expected, actual, msg=None):
        """Check integer equals.

        Args:
            first: actual value.
            second: expected value.
            msg: error message.
        """

        self.built_in.run_keyword_and_continue_on_failure(
            'BuiltIn.Should Be Equal As Integers', actual, expected, msg
        )

    def length_should_be(self, item, length, msg=None):
        """Check item length.

        Args:
            item: element for check.
            length: expected length.
            msg: error message.
        """

        self.built_in.run_keyword_and_continue_on_failure(
            'BuiltIn.Length Should Be', item, length, msg
        )

    def should_not_be_empty(self, item, msg=None):
        """Check is not be empty.

        Args:
            item: element for check.
            msg: error message.
        """

        self.built_in.run_keyword_and_continue_on_failure(
            'BuiltIn.Should Not Be Empty', item, msg
        )

    def list_should_contain_sub_list(self, list1, list2, msg=None):
        """Check list if contains sub list.

        Args:
            list1: where check.
            list2: list for check.
            msg: error message.
        """

        self.built_in.run_keyword_and_continue_on_failure(
            'Collections.List Should Contain Sub List', list1, list2, msg
        )
