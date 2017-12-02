import pandas as pd
df=pd.read_csv("C:/Users/MBD/Desktop/MLproject/DLReadmissionPrediction-master/data/df_charts_details.csv")
df_indexed=df.set_index(['icustay_id','itemid'],drop=True)
df_indexed['charttime']=df_indexed['charttime'].astype('datetime64[ns]')
df_indexed.groupby('icustay_id').apply(lambda x: x.sort_values('charttime',inplace=True))
df_indexed['charttime']=df_indexed.groupby('icustay_id')['charttime'].apply(lambda x: x-x.iloc[0])
df_indexed['valuenum'].fillna(df_indexed['value'],inplace=True)
print (df_indexed.head)
