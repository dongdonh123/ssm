	function tag(v_num){
		var result = "";
		var iText = "";
		if(v_num == 146 || v_num == 145 ){
			result = "<select id="+v_num+">"
					+"<option hidden>직업을 선택해 주세요</option>"
			        +"<option value='가수'>가수</option>"
			        +"<option value='간호사'>간호사</option>"
			        +"<option value='개그맨'>개그맨</option>"
			        +"<option value='건축가'>건축가</option>"
			        +"<option value='경기심판'>경기심판</option>"
			        +"<option value='경영컨설턴트'>경영컨설턴트</option>"
			        +"<option value='경제학연구원'>경제학연구원</option>"
			        +"<option value='경찰관'>경찰관</option>"
			        +"<option value='경호원'>경호원</option>"
			        +"<option value='고위공무원'>고위공무원</option>"
			        +"<option value='공업기계조작원'>공업기계조작원</option>"
			        +"<option value='공인중개인'>공인중개인</option>"
			        +"<option value='과수작물재배자'>과수작물재배자</option>"
			        +"<option value='교육학연구원'>교육학연구원</option>"
			        +"<option value='교장'>교장</option>"
			        +"<option value='국악인'>국악인</option>"
			        +"<option value='국제긴급구호요원'>국제긴급구호요원</option>"
			        +"<option value='국회의원'>국회의원</option>"
			        +"<option value='군인'>군인</option>"
			        +"<option value='극작가'>극작가</option>"
			        +"<option value='기업고위임원'>기업고위임원</option>"
			        +"<option value='기자'>기자</option>"
			        +"<option value='다문화가정상담전문가'>다문화가정상담전문가</option>"
			        +"<option value='대체에너지개발연구원'>대체에너지개발연구원</option>"
			        +"<option value='동물조련사'>동물조련사</option>"
			        +"<option value='드라마작가'>드라마작가</option>"
			        +"<option value='로봇연구원'>로봇연구원</option>"
			        +"<option value='마술사'>마술사</option>"
			        +"<option value='만화가'>만화가</option>"
			        +"<option value='모델'>모델</option>"
			        +"<option value='물리학자'>물리학자</option>"
			        +"<option value='방송작가'>방송작가</option>"
			        +"<option value='변호사'>변호사</option>"
			        +"<option value='비서'>비서</option>"
			        +"<option value='비행기승무원'>비행기승무원</option>"
			        +"<option value='비행기조종사'>비행기조종사</option>"
			        +"<option value='사서'>사서</option>"
			        +"<option value='사회복지사'>사회복지사</option>"
			        +"<option value='상담가'>상담가</option>"
			        +"<option value='생물학자'>생물학자</option>"
			        +"<option value='서비스강사'>서비스강사</option>"
			        +"<option value='세무사'>세무사</option>"
			        +"<option value='소방관'>소방관</option>"
			        +"<option value='소설가'>소설가</option>"
			        +"<option value='쇼핑호스트'>쇼핑호스트</option>"
			        +"<option value='수학연구원'>수학연구원</option>"
			        +"<option value='스턴트맨'>스턴트맨</option>"
			        +"<option value='스포츠강사'>스포츠강사</option>"
			        +"<option value='스포츠트레이너'>스포츠트레이너</option>"
			        +"<option value='시니어컨설턴트'>시니어컨설턴트</option>"
			        +"<option value='시인'>시인</option>"
			        +"<option value='심리학연구원'>심리학연구원</option>"
			        +"<option value='아나운서'>아나운서</option>"
			        +"<option value='애니메이션작가'>애니메이션작가</option>"
			        +"<option value='역사학연구원'>역사학연구원</option>"
			        +"<option value='연극연출가'>연극연출가</option>"
			        +"<option value='연기자'>연기자</option>"
			        +"<option value='연주가'>연주가</option>"
			        +"<option value='영화감독'>영화감독</option>"
			        +"<option value='외교관'>외교관</option>"
			        +"<option value='외환딜러'>외환딜러</option>"
			        +"<option value='운동선수'>운동선수</option>"
			        +"<option value='웹디자이너'>웹디자이너</option>"
			        +"<option value='은행출납사무원'>은행출납사무원</option>"
			        +"<option value='응급구조사'>응급구조사</option>"
			        +"<option value='의사'>의사</option>"
			        +"<option value='의학연구원'>의학연구원</option>"
			        +"<option value='이러닝(E-learning)교수설계사'>이러닝(E-learning)교수설계사</option>"
			        +"<option value='인테리어디자이너'>인테리어디자이너</option>"
			        +"<option value='일반공무원'>일반공무원</option>"
			        +"<option value='자동차영업원'>자동차영업원</option>"
			        +"<option value='자동차정비원'>자동차정비원</option>"
			        +"<option value='작곡가'>작곡가</option>"
			        +"<option value='재활승마운동사'>재활승마운동사</option>"
			        +"<option value='제품디자이너'>제품디자이너</option>"
			        +"<option value='조경원'>조경원</option>"
			        +"<option value='중.고등학교 교사(문과)'>중.고등학교 교사(문과)</option>"
			        +"<option value='중.고등학교 교사(이과)'>중.고등학교 교사(이과)</option>"
			        +"<option value='지질학연구원'>지질학연구원</option>"
			        +"<option value='지휘자'>지휘자</option>"
			        +"<option value='천문학자'>천문학자</option>"
			        +"<option value='철도 및 지하철기관사'>철도 및 지하철기관사</option>"
			        +"<option value='철학연구원'>철학연구원</option>"
			        +"<option value='초등교사'>초등교사</option>"
			        +"<option value='컴퓨터프로그래머'>컴퓨터프로그래머</option>"
			        +"<option value='특용작물재배자'>특용작물재배자</option>"
			        +"<option value='판매원'>판매원</option>"
			        +"<option value='패션디자이너'>패션디자이너</option>"
			        +"<option value='폴리아티스트(음향효과맨)'>폴리아티스트(음향효과맨)</option>"
			        +"<option value='프로게이머'>프로게이머</option>"
			        +"<option value='항공기정비원'>항공기정비원</option>"
			        +"<option value='호텔지배인'>호텔지배인</option>"
			        +"<option value='화가'>화가</option>"
			        +"<option value='화학자'>화학자</option>"
			        +"<option value='화훼재배자'>화훼재배자</option>"
			        +"<option value='회계사무원'>회계사무원</option>"
			        +"<option value='etc'>기타(오른쪽에 직접 입력)</option>"
			        +"<option >아직 결정 못함</option>";
		}
		iText = "<input type='text' id="+v_num+" name="+v_num+" class="+v_num+" placeholder='기타 선택시 직업명 입력'>"
		result = result+iText;
		return result;
	}
	
	function tag2(v_num){
		var result = "";
		var iText = "";
		if(v_num == 149 || v_num == 148 ){
			result = "<select id="+v_num+">"
					+"<option hidden>과목을 선택해 주세요</option>"
			        +"<option value='국어'>국어</option>"
			        +"<option value='사회(사회/역사)'>사회(사회/역사)</option>"
			        +"<option value='도덕'>도덕</option>"
			        +"<option value='수학'>수학</option>"
			        +"<option value='과학'>과학</option>"
			        +"<option value='기술가정'>기술가정</option>"
			        +"<option value='체육'>체육</option>"
			        +"<option value='음악'>음악</option>"
			        +"<option value='미술'>미술</option>"
			        +"<option value='영어'>영어</option>"
			        +"<option value='한문'>한문</option>"
			        +"<option value='보건'>보건</option>"
			        +"<option value='진로와 직업'>진로와 직업</option>"
			        +"<option value='제2외국어'>제2외국어</option>"
			        +"<option value='기타'>기타</option>";
		}
		return result;
	}