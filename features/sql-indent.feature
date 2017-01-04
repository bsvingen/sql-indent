Feature: Basic indentation
  Background:
    When the buffer is empty
    When I turn on sql-mode


  Scenario: Indent unindented SELECT statement
    When I insert:
    """
    SELECT * FROM foo
    WHERE a=1
    AND b=2
    ORDER BY c;
    """
    When I indent the buffer
    Then I should see:
    """
    SELECT * FROM foo
    WHERE a=1
        AND b=2
    ORDER BY c;
    """


  Scenario: Indent badly indendet SELECT statement
    When I insert:
    """
    SELECT * FROM foo
            WHERE a=1
      AND b=2
        ORDER BY c;
    """
    When I indent the buffer
    Then I should see:
    """
    SELECT * FROM foo
    WHERE a=1
        AND b=2
    ORDER BY c;
    """


  Scenario: Setting the offset
    When I insert:
    """
    SELECT * FROM foo
    WHERE a=1
    AND b=2;
    """
    When I set sql-indent-offset to 6
    When I indent the buffer
    Then I should see:
    """
    SELECT * FROM foo
    WHERE a=1
          AND b=2;
    """
