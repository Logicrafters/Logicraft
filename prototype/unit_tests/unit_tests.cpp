﻿//
// Created by charles on 09/10/2025.
//

#include <gtest/gtest.h>
#include "foo.h"

TEST(TestSuiteName, TestName)
{
    Foo foo;
    foo.Bar();

    EXPECT_EQ(3, 3);
}