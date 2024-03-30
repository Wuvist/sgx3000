import json
import numpy as np

info = None
with open('data/info.json', encoding="utf8") as f:
    info = json.load(f)
    for _, item in info.items():
        if not "sector" in item:
            item["sector"] = "None"

        if not "industry" in item:
            item["industry"] = "None"

qt = None
with open('data/quote_table.json', encoding="utf8") as f:
    qt = json.load(f)


def get_active():
    data = dict()
    for k, v in qt.items():
        if get_avg_vol(k) > 10000:
            data[k] = get_mc(k)
    return data


all_tickers = ["1A0","1A1","1A4","1AZ","1B0","1B1","1B6","1C0","1D0","1D1","1D3","1D4","1D5","1E3","1F0","1F1","1F2","1F3","1G1","1G6","1H2","1H3","1H8","1J0","1J4","1J5","1J7","1R6","1V3","1Y1","40B","40E","40F","40N","40T","40V","40W","41B","41F","41H","41O","41T","42C","42D","42E","42F","42L","42N","42R","42S","42T","42U","42W","42Z","43A","43B","43E","43F","43Q","49B","500","504","505","508","528","532","533","540","541","543","544","546","554","558","564","566","569","570","575","578","579","580","581","583","584","585","594","595","596","5AB","5AE","5AI","5AL","5AU","5BI","5BS","5CF","5CP","5CR","5CT","5DD","5DM","5DN","5DO","5DP","5DS","5DX","5EB","5EF","5EG","5EN","5EV","5EW","5F4","5F7","5FL","5FW","5FX","5G1","5G2","5G3","5G4","5G9","5GD","5GI","5GJ","5GZ","5HG","5HH","5HT","5HV","5I1","5I4","5IC","5IE","5IF","5IG","5JK","5JS","5KI","5LE","5LY","5MD","5ML","5MZ","5NF","5NV","5OC","5OI","5OQ","5OR","5OU","5OX","5PC","5PD","5PF","5PO","5QR","5QT","5QY","5RA","5RC","5RE","5RF","5SO","5SR","5SY","5TI","5TJ","5TP","5TT","5TY","5UA","5UF","5UL","5UN","5UX","5VC","5VI","5VJ","5VP","5VS","5WA","5WF","5WG","5WH","5WJ","5WV","600","8A1","8AZ","8K7","8U7U","8YY","9CI","9QX","A04","A05","A17U","A26","A30","A31","A33","A34","A35","A50","A52","A55","A78","A7RU","AAJ","ACV","ADN","AFC","AGS","AIY","AJ2","AJBU","AOF","AP4","AU8U","AVX","AW9U","AWC","AWG","AWI","AWK","AWM","AWV","AWX","AWZ","AXB","AYN","AYV","AZA","AZG","AZR","AZT","B0Z","B26","B28","B49","B58","B61","B69","B73","B9S","BAC","BAI","BAZ","BBP","BBW","BCD","BCV","BCY","BCZ","BDA","BDR","BDU","BDX","BEC","BEH","BEI","BEW","BEZ","BFI","BFK","BFT","BFU","BGO","BHD","BHK","BHU","BIP","BIX","BJD","BJV","BJZ","BKA","BKK","BKV","BKW","BKX","BKZ","BLA","BLH","BLR","BLS","BLU","BLZ","BMGU","BMT","BN2","BN4","BNE","BPF","BQC","BQD","BQF","BQM","BQN","BQP","BRD","BRS","BS6","BSL","BTE","BTF","BTG","BTJ","BTM","BTOU","BTP","BTX","BTY","BUOU","BVA","BVQ","BWCU","BWM","BXE","BYI","BYJ","C04","C05","C06","C07","C09","C13","C2PU","C33","C38U","C41","C52","C6L","C70","C76","C8R","C9Q","CC3","CEDU","CFA","CGN","CHJ","CHZ","CIN","CJLU","CJN","CLN","CLR","CMOU","CNE","COI","CRPU","CTO","CWBU","CWCU","CXS","CXU","CY6U","CYB","CYC","CYW","CYX","D01","D03","D05","D07","D5IU","D8DU","DCRU","DHLU","DM0","DRX","DU4","E27","E28","E3B","E5H","E6R","E9L","EB5","EB7","EG0","EH5","EHG","EMI","ENV","ER0","ES3","ESG","ESU","EVD","EVS","F03","F10","F13","F17","F1E","F34","F83","F86","F99","F9D","FQ7","FRQ","G07","G0I","G13","G1N","G20","G3B","G50","G92","GRE","GRN","GRO","GRQ","GRU","GSD","GU5","H02","H07","H12","H13","H15","H18","H1N","H20","H22","H30","H78","HD9","HKB","HMN","HQU","HSS","HST","I98","ICM","ICU","IW5","IX2","J03","J2T","J36","J69U","J85","J91U","JK8","JLB","JYEU","K03","K29","K3MD","K3RD","K3SD","K6S","K71U","K75","KJ5","KJ7","KUH","KUO","KUX","KV4","L02","L19","L23","L38","LCS","LCU","LG9","LIW","LJ3","LMS","LS9","LSS","LSU","LUY","LVR","LYY","M01","M03","M04","M05","M11","M14","M15","M1GU","M44U","M62","MBH","ME8U","MF6","MIJ","MMS","MMT","MR7","MT1","MV4","MXNU","MZH","N01","N02","N08","N0Z","N2H","N2IU","N32","N5YD","N6DD","N6M","NC2","NEX","NHD","NIO","NLC","NO4","NPL","NPW","NR7","NS8U","NTA","NXR","O08","O10","O39","O5RU","O87","O9A","O9E","O9P","OAJ","ODBU","OMK","OTS","OTX","OU8","OV8","OVQ","OXMU","OYY","P15","P34","P36","P40U","P52","P5P","P74","P7VU","P8A","P8Z","P9D","PA3","PGS","PH0","PPC","PRH","PU6D","Q01","Q0F","Q0X","Q5T","QC7","QES","QK9","QL2","QL3","QNS","QR9","QS0","QS9","QSD","QZG","R14","RC5","RCU","RDR","RE4","RQ1","RS1","RXS","S07","S08","S19","S20","S23","S27","S29","S2D","S35","S3N","S41","S44","S51","S56","S58","S59","S61","S63","S68","S69","S71","S7OU","S7P","S85","S9B","SCY","SEJ","SES","SGR","SHD","SJY","SK3","SK6U","SO7","SQQ","SQU","SRT","SRU","SSS","SSU","STC","STG","T09","T12","T13","T14","T15","T24","T41","T43","T4B","T55","T6I","T82U","TATD","TCPD","TCU","TID","TPED","TQ5","TS0U","TSH","TVV","TWL","U06","U09","U10","U11","U13","U14","U77","U96","U9E","UD1U","UD2","URR","UUK","UV1","V03","V2Y","V3M","V8Y","VC2","VI2","VND","VNM","VVL","W05","WJP","WKS","WPC","WVJ","XCF","XJB","XVG","XWA","XZL","Y03","Y06","Y35","Y3D","Y45","Y8E","Y92","YF8","YK9","YYB","YYN","YYR","YYY","Z25","Z4D","Z59","Z74","Z77","ZHD","ZHS","ZHY","ZKX","ZXY","i06","i07","i11","i15","i49"]


def get_all_mc():
    '''return all stocks with market cap info available'''

    data = dict()
    for k, v in qt.items():
        mc = get_mc(k)
        if mc != np.nan:
            data[k] = mc
    return data


def get_all_avg_vol():
    '''return all stocks with averge volumn info available'''

    data = dict()
    for k, _ in qt.items():
        vol = get_avg_vol(k)
        if vol != np.nan:
            data[k] = vol
    return data


def get_avg_vol(ticker):
    try:
        v = qt[ticker]
        vol = v["Avg. Volume"] * v["Open"]
        return vol
    except KeyError:
        return np.NaN


def get_mc(ticker):
    try:
        return info[ticker]["marketCap"]
    except KeyError:
        return np.NaN


def get_sectors():
    return count_item_by_key(info, 'sector')


def sector():
    sectors = count_item_by_key(info, 'sector')
    print(json.dumps(sectors, ensure_ascii=False, indent=4))


def industry():
    industries = count_item_by_key(info, 'industry')
    print(json.dumps(industries, ensure_ascii=False, indent=4))


def count_item_by_key(data, key):
    result = dict()
    for _, item in data.items():
        val = item[key]
        if val in result:
            result[val] = result[val] + 1
        else:
            result[val] = 1

    return dict(sorted(result.items(), key=lambda x: x[1], reverse=True))


def industry_in_sector(sector):
    industries = dict()
    data = {key: v for key, v in info.items(
    ) if 'sector' in v and v['sector'] == sector}
    if sector == "None":
        data = {key: v for key, v in info.items() if not 'sector' in v}

    print("Sector: " + sector)
    industries = count_item_by_key(data, 'industry')

    print(json.dumps(industries, ensure_ascii=False, indent=4))


def find_sector(keyword):
    return {key: v for key, v in info.items(
    ) if 'sector' in v and keyword in v['sector'].lower()}


def find_industry(keyword):
    data = {key: v for key, v in info.items(
    ) if 'industry' in v and keyword in v['industry'].lower()}

    print("Industry: " + keyword)
    for key, v in data.items():
        print(key + "\t" + v['industry'])

    return data
