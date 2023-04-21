#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd 
from tqdm import tqdm
import my_utils as mu


# In[4]:


df = mu.get_rawdata('GOLD')


# In[ ]:





# In[15]:


df.iloc[0]['matches']['info']['participants'][0].keys()


# In[18]:


df.iloc[0]['matches']['info']['participants'][0]['summoner1Id']


# In[34]:


def get_match_timeline_df(df):
    df_creater = []
     columns = ['gameId', 'gameDuration', 'gameVersion', 'summonerName', 'participantId','championName',
                'champExperience', 'teamPosition', 'teamId', 'win','item0','item1','item2','item3','item4','item5','item6','summoner_spell_1','summoner_spell_2','kills',
                'deaths', 'assists','totalDamageDealtToChampions','totalDamageTaken']
    print('소환사 스텟 생성중...')
    for i in tqdm(range(len(df))):
        if df.iloc[0].matches['info']['gameDuration'] > 900:
            # matches 관련된 데이터
            for j in range(10):
                try:
                    tmp = []
                    tmp.append(df.iloc[i].match_id)
                    tmp.append(df.iloc[i].matches['info']['gameDuration'])
                    tmp.append(df.iloc[i].matches['info']['gameVersion'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['summonerName'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['summonerLevel'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['participantId'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['championName'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['champExperience'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['teamPosition'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['teamId'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['win'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item0'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item1'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item2'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item3'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item4'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item5'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item6'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['summoner1Id'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['summoner2Id'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['kills'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['deaths'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['assists'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['totalDamageDealtToChampions'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['totalDamageTaken'])
                except:
                    continue
                df_creater.append(tmp)
        df1=pd.DataFrame(df_creater, columns=columns).drop_duplicates()


# In[39]:


def get_match_timeline_df(df):
    df_creater = []
    columns = ['gameId', 'gameDuration', 'gameVersion', 'summonerName', 'summonerLevel','participantId','championName',
    'champExperience', 'teamPosition', 'teamId', 'win','item0','item1','item2','item3','item4','item5','item6','summoner_spell_1','summoner_spell_2','kills',
    'deaths', 'assists','totalDamageDealtToChampions','totalDamageTaken']
    print('소환사 스텟 생성중...')

    for i in tqdm(range(len(df))):
        if df.iloc[0].matches['info']['gameDuration'] > 900:
        # matches 관련된 데이터
            for j in range(10):
                try:
                    tmp = []
                    tmp.append(df.iloc[i].match_id)
                    tmp.append(df.iloc[i].matches['info']['gameDuration'])
                    tmp.append(df.iloc[i].matches['info']['gameVersion'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['summonerName'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['summonerLevel'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['participantId'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['championName'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['champExperience'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['teamPosition'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['teamId'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['win'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item0'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item1'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item2'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item3'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item4'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item5'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['item6'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['summoner1Id'])
                    tmp.append(df.iloc[i]['matches']['info']['participants'][j]['summoner2Id'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['kills'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['deaths'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['assists'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['totalDamageDealtToChampions'])
                    tmp.append(df.iloc[i].matches['info']['participants'][j]['totalDamageTaken'])
                except:
                    continue

                df_creater.append(tmp)
    df1=pd.DataFrame(df_creater, columns=columns).drop_duplicates()
    return df1


# In[40]:


df_match= get_match_timeline_df(df)


# In[41]:


df_match


# In[ ]:




