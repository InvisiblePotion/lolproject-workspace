#!/usr/bin/env python
# coding: utf-8

# 챔피언 모든 이미지 가져오는 함수 (아이콘, 패시브, 스킬, 스킨)
# key값으로 championId 사용 

# In[14]:


import requests
import my_utils as mu
from tqdm import tqdm
import time
import pandas as pd
tqdm.pandas()


# 아래 함수는 url값 입력으로 줬지만 추후 챔피언이름 입력 하는 걸로도 바꿀 수 있음
# url: https://ddragon.leagueoflegends.com/cdn/13.8.1/data/ko_KR/champion.json, 챔피언 정보 요약
# url2: http://ddragon.leagueoflegends.com/cdn/13.8.1/data/ko_KR/champion/{name}.json, 챔피언별 상세정보

# In[66]:


def championImg(url):
    res = requests.get(url).json()
    df_origin = pd.DataFrame(res)
    df_origin.reset_index(inplace=True)
    # dataDragon에서 챔피언 정보 json으로 받아옴 
    
    df_summary=[]
    for i in range(len(df_origin)):
        lst5=[]
        lst5.append(df_origin.iloc[i]['data']['key'])
        lst5.append(df_origin.iloc[i]['data']['id'])
        lst5.append(df_origin.iloc[i]['data']['name'])
        for j in range(2):
            try:
                lst5.append(df_origin.iloc[i]['data']['tags'][j])
            except: lst5.append(0)
        df_summary.append(lst5)
        
        col = ['championId','championName','championName_KR','tag1','tag2']
        df_tags = pd.DataFrame(df_summary,columns=col)
    # columns 'championId','championName','championName_KR','tag1','tag2'으로 df_tags 추출 
    
    df_img_origin = []
    for p in range(len(df_tags)):
        lst4 = []
        name = df_tags['championName'][p]
        url2 = f'http://ddragon.leagueoflegends.com/cdn/13.8.1/data/ko_KR/champion/{name}.json'
        res2 = requests.get(url2).json()

        lst4.append(df_tags['championId'][p])
        lst4.append(df_tags['championName'][p])
        lst4.append(res2)
        df_img_origin.append(lst4)
        
    col = ['championId','championName','info']
    df_img = pd.DataFrame(df_img_origin, columns = col)
    df_img.reset_index(inplace=True)
    # df_tags의 championId 가져와서 url2랑 매치하여 df_img 뽑음, id별 챔피언 상세정보(info 컬럼)
    
    df_get_img=[]     
    for t in range(len(df_img)):
        lst = []
        name = df_img.iloc[t]['championName']
        championId = df_img.iloc[t]['championId']

        champ_icon = df_img['info'][t]['data'][f'{name}']['image']['full']
        passive = df_img.iloc[t]['info']['data'][f'{name}']['passive']['image']['full']

        lst.append(championId)
        lst.append(champ_icon)
        lst.append(passive)

        for k in range(0,4) :
            lst3 = []
            champ_spell_name = df_img['info'][t]['data'][f'{name}']['spells'][k]['id']
            lst3.append(f"{champ_spell_name}.png")

            lst.append(lst3)

        for j in range(len(df_img['info'][t]['data'][f'{name}']['skins'])):
            lst2 = []
            skins_name = df_img['info'][t]['data'][f'{name}']['skins'][j]['name']
            skins_num = df_img['info'][t]['data'][f'{name}']['skins'][j]['num']

            lst2.append(skins_name)
            lst2.append(f"{name}_{skins_num}.jpg")  
            lst.append(lst2)


        df_get_img.append(lst)
        #col = ['championId','img_square','img_passive','img_spellQ1','img_spellW2','img_spellE3','img_spellR4','img_L_def','img_L_skin1','img_L_skin2','img_L_skin3','img_L_skin4','img_L_skin5','img_L_skin6','img_L_skin7','img_L_skin8','img_L_skin9','img_L_skin10','img_L_skin11','img_L_skin12','img_L_skin13','img_L_skin14','img_L_skin15','img_L_skin16']
        df_imgAll = pd.DataFrame(df_get_img)
        
        
    return df_get_img


# In[69]:


url = 'https://ddragon.leagueoflegends.com/cdn/13.8.1/data/ko_KR/champion.json'
df_all_champ_img = pd.DataFrame(championImg(url))


# 0번 컬럼 > championID
# 
# 1번 컬럼 > 챔피언 사각형 아이콘
# http://ddragon.leagueoflegends.com/cdn/13.8.1/img/champion/{Aatrox.png}
# 
# 2번 컬럼 > 챔피언 패시브 사진
# https://ddragon.leagueoflegends.com/cdn/13.8.1/img/passive/{Aatrox_Passive.png}
# 
# 3~6번 컬럼 > 챔피언 스킬 사진
# image champion spell{AatroxQ,AatroxW,AatroxE,AatroxR}
# https://ddragon.leagueoflegends.com/cdn/13.8.1/img/spell/{AatroxQ.png}
# 
# 7~N번 컬럼 > 챔피언 사진 큰 것(7번은 기본 챔피언 이미지 큰것, 8번 부터 스킨 이미지 큰 것) 
# image big(all_skins, 0 default)
# https://ddragon.leagueoflegends.com/cdn/img/champion/splash/{Aatrox_0.jpg}
