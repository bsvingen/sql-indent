Feature: Basic indentation
  Background:
    When the buffer is empty
    When I turn on sql-mode
    When I set indent-tabs-mode to nil


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


  Scenario: Indent typical CREATE TABLE statement
    When I insert:
    """
    CREATE TABLE foo (
    x INTEGER,
    y INTEGER
    );
    """
    When I indent the buffer
    Then I should see:
    """
    CREATE TABLE foo (
            x INTEGER,
            y INTEGER
            );
    """


   Scenario: Simple indent with brackets
     When I insert:
     """
     UPDATE foo SET bar = (
     SELECT 1
     );
     """
     When I indent the buffer
     Then I should see:
     """
     UPDATE foo SET bar = (
         SELECT 1
             );
     """

   Scenario: Indent with brackets
     When I insert:
     """
     UPDATE foo SET bar = (
     SELECT 1
     FROM baz
     WHERE x=1
     AND y=2
     );
     """
     When I indent the buffer
     Then I should see:
     """
     UPDATE foo SET bar = (
         SELECT 1
         FROM baz
         WHERE x=1
             AND y=2
             );
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
