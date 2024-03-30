from dataclasses import dataclass
import pandas as pd
from typing import List


def to_df(data, columns):
    df = pd.DataFrame.from_dict(data, orient='index').reset_index()
    df.columns = columns
    return df


@dataclass
class YearMonth:
    year: int
    month: int

    def __str__(self):
        return (f"{self.year}-{self.month:02d}-01")

    def __eq__(self, other) -> bool:
        return self.year == other.year and self.month == other.month

    def __ge__(self, other) -> bool:
        if self == other:
            return True
        return self > other

    def __gt__(self, other) -> bool:
        if self.year > other.year:
            return True
        if self.year == other.year:
            return self.month > other.month

        return False

    def __le__(self, other) -> bool:
        if self == other:
            return True
        return self < other

    def __lt__(self, other) -> bool:
        return other > self


def get_next(now: YearMonth, months: int) -> YearMonth:
    '''Return YearMonth for next months
    If now: 2011-11 months: 3, will return 2012-02
    '''
    year = now.year
    month = now.month + months
    while month > 12:
        month -= 12
        year += 1

    # incase months is negative
    while month < 1:
        month += 12
        year -= 1

    return YearMonth(year, month)


def get_quarter_strs(year: int, month: int, count: int) -> List[YearMonth]:
    '''get_quarter_strs(2000, 1, 98) will return 98 YearMonth
    ranging from 2000-01-01 to 2024-04-01
    '''
    quarters: List[YearMonth] = []
    for _ in range(0, count):
        quarters.append(YearMonth(year, month))
        month += 3
        if month > 12:
            month = month - 12
            year += 1

    return quarters
