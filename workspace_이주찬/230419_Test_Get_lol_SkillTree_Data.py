#!/usr/bin/env python
# coding: utf-8

# In[73]:


import my_utils as mu
import pandas as pd


# In[5]:


df = mu.get_rawdata('GOLD')


# In[9]:


df


# In[36]:


df.iloc[1].matches['info']['participants']


# In[ ]:


item0': 4630,
  'item1': 1026,
  'item2': 3157,
  'item3': 3116,
  'item4': 3040,
  'item5': 6657,
  'item6': 3364,


# In[51]:


df.iloc[1].matches['info']['participants'][0]


# In[47]:


df.iloc[1].matches['info']['participants'][1]['championName']


# In[54]:


df.iloc[1].timeline['info']['frames'][0]['events']


# In[59]:


df.iloc[0].timeline['info']['frames'][2]['events'][1]


# In[57]:


df.iloc[0].matches['info']


# In[ ]:


[{'realTimestamp': 1679555966040, 'timestamp': 0, 'type': 'PAUSE_END'}]
1
df.iloc[0].timeline['info']['frames'][2]['events'][1]
{'levelUpType': 'NORMAL',
 'participantId': 9,
 'skillSlot': 1,
 'timestamp': 64635,
 'type': 'SKILL_LEVEL_UP'}


# In[107]:


df_create = []
for i in range(len(df)):
    try:
        matchId = df.iloc[i].match_id
        match = df.iloc[i].matches['info']
        timeline = df.iloc[i].timeline['info']
        for j in range(10):
            lst_tmp = []
            lst_tmp.append(matchId)
            lst_tmp.append(df.iloc[i].matches['info']['participants'][j]['participantId'])
            lst_tmp.append(df.iloc[i].matches['info']['participants'][j]['teamPosition'])
            lst_tmp.append(df.iloc[i].matches['info']['participants'][j]['championName'])

            df_create.append(lst_tmp)
    except:
        continue
col_lst = ['matchId','participantId','teamPosition','championName']
df_key = pd.DataFrame(df_create, columns = col_lst)
    


# In[105]:


df_create = []
for i in range(len(df)):
    try:
        matchId = df.iloc[i].match_id
        match = df.iloc[i].matches['info']
        timeline = df.iloc[i].timeline['info']
        skills = list(map(lambda x: list(filter(lambda z: z['type'] == 'SKILL_LEVEL_UP', x['events'])) ,timeline['frames']))
        skills_log = [element for array in skills for element in array]
        
        for j in range(len(skills_log)):
            lst_tmp = []
            lst_tmp.append(matchId)
            lst_tmp.append(skills_log[j]['levelUpType'])
            lst_tmp.append(skills_log[j]['participantId'])
            lst_tmp.append(skills_log[j]['skillSlot'])
            lst_tmp.append(skills_log[j]['timestamp'])
            lst_tmp.append(skills_log[j]['type'])
                
            df_create.append(lst_tmp)
    except:
        continue
col_lst = ['matchId','levelUpType','participantId','skillSlot','timestamp','type']
df_skills = pd.DataFrame(df_create, columns = col_lst)


# In[91]:


timeline = df.iloc[0].timeline['info']
skills = list(map(lambda x: list(filter(lambda z: z['type'] == 'SKILL_LEVEL_UP', x['events'])) ,timeline['frames']))         
skills_log = [element for array in skills for element in array]


# In[106]:


df_skills


# In[109]:


df_key


# In[115]:


skills_df = pd.merge(left = df_key , right = df_skills, how = "inner", on = ["matchId","participantId"])


# In[114]:


skills_df['matchId']='KR_6417278992'


# In[116]:


sample = skills_df


# In[123]:


sample[championName].unique


# In[132]:


def skillTree(df):
    df_create = []
    for i in range(len(df)):
        try:
            matchId = df.iloc[i].match_id
            match = df.iloc[i].matches['info']
            timeline = df.iloc[i].timeline['info']
            for j in range(10):
                lst_tmp = []
                lst_tmp.append(matchId)
                lst_tmp.append(df.iloc[i].matches['info']['participants'][j]['participantId'])
                lst_tmp.append(df.iloc[i].matches['info']['participants'][j]['teamPosition'])
                lst_tmp.append(df.iloc[i].matches['info']['participants'][j]['championName'])

                df_create.append(lst_tmp)
        except:
            continue
    col_lst = ['matchId','participantId','teamPosition','championName']
    df_key = pd.DataFrame(df_create, columns = col_lst)
    
    df_create1 = []
    for k in range(len(df)):
        try:
            matchId = df.iloc[k].match_id
            match = df.iloc[k].matches['info']
            timeline = df.iloc[k].timeline['info']
            skills = list(map(lambda x: list(filter(lambda z: z['type'] == 'SKILL_LEVEL_UP', x['events'])) ,timeline['frames']))
            skills_log = [element for array in skills for element in array]

            for p in range(len(skills_log)):
                lst_tmp1 = []
                lst_tmp1.append(matchId)
                lst_tmp1.append(skills_log[p]['levelUpType'])
                lst_tmp1.append(skills_log[p]['participantId'])
                lst_tmp1.append(skills_log[p]['skillSlot'])
                lst_tmp1.append(skills_log[p]['timestamp'])
                lst_tmp1.append(skills_log[p]['type'])

                df_create1.append(lst_tmp1)
        except:
            continue
    col_lst1 = ['matchId','levelUpType','participantId','skillSlot','timestamp','type']
    df_skills = pd.DataFrame(df_create1, columns = col_lst1)
    
    skills_df = pd.merge(left = df_key , right = df_skills, how = "inner", on = ["matchId","participantId"])
    return skills_df


# In[133]:


skillTree(df)


# In[129]:


df


# In[ ]:




