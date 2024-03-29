import pandas as pd


def to_df(data, columns):
    df = pd.DataFrame.from_dict(data, orient='index').reset_index()
    df.columns = columns
    return df
