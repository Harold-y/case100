<%--
  Created by IntelliJ IDEA.
  User: Destine.Yuri
  Date: 2020/7/28
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Case100</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/js/personalCollege.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--Automatically Redirect to Mobile Page -->
    <script type="text/javascript">
        function browserRedirect() {
            var sUserAgent = navigator.userAgent.toLowerCase();
            if (/ipad|iphone|midp|rv:1.2.3.4|ucweb|android|windows ce|windows mobile/.test(sUserAgent)) {
                //跳转移动端页面
                window.location.href="../mobileServer/main.jsp";
            }
        }
        browserRedirect();
    </script>
</head>
<style>
    fieldset{padding:.35em .625em .75em;margin:0 2px;border:1px solid silver}
    legend{padding:.5em;border:0;width:auto}
    .btn_college
    {
        width:350px;
        height: 35px;
    }
    #maindiv
    {
        position: relative;
    }
    #div_search
    {
        position: absolute;
        top:48px;
        z-index: 9999;
    }
    .layui-form-label
    {
        width:100px;
    }
    #select_major,#add_alumni,#add_feel,.layui-input
    {
        width:300px;
    }
</style>
<body>
    <div id="maindiv">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend><i class="layui-icon layui-icon-add-1"></i>添加Offer档案</legend>
        </fieldset>
        <div class="layui-card layui-bg-green" id="div_signUpSuccess" v-show="ReviseSuccess1">
            <div class="layui-card-header">提示</div>
            <div class="layui-card-body">
                您已经操作成功！
            </div>
        </div>
        <div id="div_addOffer">

                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="layui-badge-dot"></span>录取学校</label>
                    <div class="layui-input-block"  >

                        <div style="display: inline-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="College" class="layui-input"
                                   @keyup="typeAddCollege" @keyup.delete="typeAddCollege"
                                   v-model="collegeName" id="input_search">
                        </div>
                        <div style="display: inline-block">
                            <button type="button" class="layui-btn" @click="addDiv_empty" >清空</button>
                        </div>
                        <div id="div_search">

                        </div>
                    </div>

                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="layui-badge-dot"></span>录取专业</label>
                    <div class="layui-input-block">
                        <%--<input type="text" name="title" lay-verify="title" autocomplete="off"
                               placeholder="Major" class="layui-input">--%>
                        <select class="form-control" name="" id="select_major" >
                            <option value="Agriculture, General">Agriculture, General</option>
                            <option value="Agribusiness Operations">Agribusiness Operations</option>
                            <option value="Agricultural Business & Management">Agricultural Business & Management</option>
                            <option value="Agricultural Economics">Agricultural Economics</option>
                            <option value="Agricultural Mechanization">Agricultural Mechanization</option>
                            <option value="Agricultural Production">Agricultural Production</option>
                            <option value="Agronomy & Crop Science">Agronomy & Crop Science</option>
                            <option value="Animal Sciences">Animal Sciences</option>
                            <option value="Food Sciences & Technology">Food Sciences & Technology</option>
                            <option value="Horticulture Operations & Management">Horticulture Operations & Management</option>
                            <option value="Horticulture Science">Horticulture Science</option>
                            <option value="Natural Resources Conservation, General">Natural Resources Conservation, General</option>
                            <option value="Environmental Science">Environmental Science</option>
                            <option value="Forestry">Forestry</option>
                            <option value="Natural Resources Management">Natural Resources Management</option>
                            <option value="Wildlife & Wildlands Management">Wildlife & Wildlands Management</option>
                            <option value="Architecture, General">Architecture, General</option>
                            <option value="Architectural Environmental Design">Architectural Environmental Design</option>
                            <option value="City/Urban/Regional Planning">City/Urban/Regional Planning</option>
                            <option value="Interior Architecture">Interior Architecture</option>
                            <option value="Landscape Architecture">Landscape Architecture</option>
                            <option value="Area Studies, General (e.g., African, Middle Eastern)">Area Studies, General (e.g., African, Middle Eastern)</option>
                            <option value="Asian Area Studies">Asian Area Studies</option>
                            <option value="European Area Studies">European Area Studies</option>
                            <option value="Latin American Area Studies">Latin American Area Studies</option>
                            <option value="North American Area Studies">North American Area Studies</option>
                            <option value="Ethnic & Minority Studies, General">Ethnic & Minority Studies, General</option>
                            <option value="African American Studies">African American Studies</option>
                            <option value="American Indian/Native American Studies">American Indian/Native American Studies</option>
                            <option value="Latino/Chicano Studies">Latino/Chicano Studies</option>
                            <option value="Women’s Studies">Women’s Studies</option>
                            <option value="Liberal Arts & General Studies*">Liberal Arts & General Studies*</option>
                            <option value="Library Science">Library Science</option>
                            <option value="Multi/Interdisciplinary Studies*">Multi/Interdisciplinary Studies*</option>
                            <option value="Art, General">Art, General</option>
                            <option value="Art History, Criticism & Conservation">Art History, Criticism & Conservation</option>
                            <option value="Fine/Studio Arts">Fine/Studio Arts</option>
                            <option value="Cinema/Film">Cinema/Film</option>
                            <option value="Cinematography/Film/Vide Production">Cinematography/Film/Vide Production</option>
                            <option value="Dance">Dance</option>
                            <option value="Design & Visual Communications, General">Design & Visual Communications, General</option>
                            <option value="Fashion/Apparel Design">Fashion/Apparel Design</option>
                            <option value="Graphic Design">Graphic Design</option>
                            <option value="Industrial Design">Industrial Design</option>
                            <option value="Interior Design">Interior Design</option>
                            <option value="Music, General">Music, General</option>
                            <option value="Music, Performance">Music, Performance</option>
                            <option value="Music, Theory & Composition">Music, Theory & Composition</option>
                            <option value="Photography">Photography</option>
                            <option value="Theatre Arts/Drama">Theatre Arts/Drama</option>
                            <option value="Accounting">Accounting</option>
                            <option value="Accounting Technician">Accounting Technician</option>
                            <option value="Business Administration & Management, General">Business Administration & Management, General</option>
                            <option value="Hotel/Motel Management">Hotel/Motel Management</option>
                            <option value="Human Resources Development/Training">Human Resources Development/Training</option>
                            <option value="Human Resources Management">Human Resources Management</option>
                            <option value="International Business Management">International Business Management</option>
                            <option value="Labor/Industrial Relations">Labor/Industrial Relations</option>
                            <option value="Logistics & Materials Management">Logistics & Materials Management</option>
                            <option value="Marketing Management & Research">Marketing Management & Research</option>
                            <option value="Office Supervision & Management">Office Supervision & Management</option>
                            <option value="Operations Management & Supervision">Operations Management & Supervision</option>
                            <option value="Organizational Behavior">Organizational Behavior</option>
                            <option value="Purchasing/Procurement/Contracts Management">Purchasing/Procurement/Contracts Management</option>
                            <option value="Restaurant/Food Services Management">Restaurant/Food Services Management</option>
                            <option value="Small Business Management/Operations">Small Business Management/Operations</option>
                            <option value="Travel/Tourism Management">Travel/Tourism Management</option>
                            <option value="Business/Management Quantitative Methods, General">Business/Management Quantitative Methods, General</option>
                            <option value="Actuarial Science*">Actuarial Science*</option>
                            <option value="Business/Managerial Economics">Business/Managerial Economics</option>
                            <option value="Finance, General">Finance, General</option>
                            <option value="Banking & Financial Support Services">Banking & Financial Support Services</option>
                            <option value="Financial Planning & Services">Financial Planning & Services</option>
                            <option value="Insurance & Risk Management">Insurance & Risk Management</option>
                            <option value="Investments & Securities">Investments & Securities</option>
                            <option value="Management Information Systems">Management Information Systems</option>
                            <option value="Real Estate">Real Estate</option>
                            <option value="Sales, Merchandising, & Marketing, General">Sales, Merchandising, & Marketing, General</option>
                            <option value="Fashion Merchandising">Fashion Merchandising</option>
                            <option value="Tourism & Travel Marketing">Tourism & Travel Marketing</option>
                            <option value="Secretarial Studies & Office Administration">Secretarial Studies & Office Administration</option>
                            <option value="Communications, General">Communications, General</option>
                            <option value="Advertising">Advertising</option>
                            <option value="Digital Communications/Media">Digital Communications/Media</option>
                            <option value="Journalism, Broadcast">Journalism, Broadcast</option>
                            <option value="Journalism, Print">Journalism, Print</option>
                            <option value="Mass Communications">Mass Communications</option>
                            <option value="Public Relations & Organizational Communication">Public Relations & Organizational Communication</option>
                            <option value="Radio & Television Broadcasting">Radio & Television Broadcasting</option>
                            <option value="Communications Technology, General">Communications Technology, General</option>
                            <option value="Graphic & Printing Equipment Operation*">Graphic & Printing Equipment Operation*</option>
                            <option value="Multimedia/Animation/Special Effects">Multimedia/Animation/Special Effects</option>
                            <option value="Radio & Television Broadcasting Technology*">Radio & Television Broadcasting Technology*</option>
                            <option value="Family & Consumer Sciences, General">Family & Consumer Sciences, General</option>
                            <option value="Adult Development & Aging/Gerontology">Adult Development & Aging/Gerontology</option>
                            <option value="Child Care Services Management">Child Care Services Management</option>
                            <option value="Child Development">Child Development</option>
                            <option value="Consumer & Family Economics">Consumer & Family Economics</option>
                            <option value="Food & Nutrition">Food & Nutrition</option>
                            <option value="Textile & Apparel">Textile & Apparel</option>
                            <option value="Parks, Recreation, & Leisure, General">Parks, Recreation, & Leisure, General</option>
                            <option value="Exercise Science/Physiology/Kinesiology">Exercise Science/Physiology/Kinesiology</option>
                            <option value="Health & Physical Education/Fitness">Health & Physical Education/Fitness</option>
                            <option value="Parks/Rec/Leisure Facilities Management">Parks/Rec/Leisure Facilities Management</option>
                            <option value="Sport & Fitness Administration/Management">Sport & Fitness Administration/Management</option>
                            <option value="Personal Services, General*">Personal Services, General*</option>
                            <option value="Cosmetology/Hairstyling*">Cosmetology/Hairstyling*</option>
                            <option value="Culinary Arts/Chef Training">Culinary Arts/Chef Training</option>
                            <option value="Funeral Services & Mortuary Science">Funeral Services & Mortuary Science</option>
                            <option value="Protective Services, General">Protective Services, General</option>
                            <option value="Corrections">Corrections</option>
                            <option value="Criminal Justice">Criminal Justice</option>
                            <option value="Fire Protection & Safety Technology">Fire Protection & Safety Technology</option>
                            <option value="Law Enforcement">Law Enforcement</option>
                            <option value="Military Technologies*">Military Technologies*</option>
                            <option value="Public Administration & Services, General">Public Administration & Services, General</option>
                            <option value="Community Organization & Advocacy">Community Organization & Advocacy</option>
                            <option value="Public Administration">Public Administration</option>
                            <option value="Public Affairs & Public Policy Analysis">Public Affairs & Public Policy Analysis</option>
                            <option value="Social Work">Social Work</option>
                            <option value="Computer & Information Sciences, General">Computer & Information Sciences, General</option>
                            <option value="Computer Networking/Telecommunications">Computer Networking/Telecommunications</option>
                            <option value="Computer Science & Programming">Computer Science & Programming</option>
                            <option value="Computer Software & Media Applications">Computer Software & Media Applications</option>
                            <option value="Computer System Administration">Computer System Administration</option>
                            <option value="Data Management Technology">Data Management Technology</option>
                            <option value="Information Science">Information Science</option>
                            <option value="Webpage Design">Webpage Design</option>
                            <option value="Mathematics, General">Mathematics, General</option>
                            <option value="Applied Mathematics">Applied Mathematics</option>
                            <option value="Statistics">Statistics</option>
                            <option value="Counseling & Student Services">Counseling & Student Services</option>
                            <option value="Educational Administration">Educational Administration</option>
                            <option value="Special Education">Special Education</option>
                            <option value="Teacher Education, General">Teacher Education, General</option>
                            <option value="Curriculum & Instruction">Curriculum & Instruction</option>
                            <option value="Early Childhood Education">Early Childhood Education</option>
                            <option value="Elementary Education">Elementary Education</option>
                            <option value="Junior High/Middle School Education">Junior High/Middle School Education</option>
                            <option value="Postsecondary Education">Postsecondary Education</option>
                            <option value="Secondary Education">Secondary Education</option>
                            <option value="Teacher Assisting/Aide Education">Teacher Assisting/Aide Education</option>
                            <option value="Teacher Education, Subject-Specific*">Teacher Education, Subject-Specific*</option>
                            <option value="Agricultural Education">Agricultural Education</option>
                            <option value="Art Education">Art Education</option>
                            <option value="Business Education">Business Education</option>
                            <option value="Career & Technical Education">Career & Technical Education</option>
                            <option value="English-as-a-Second-Language Education">English-as-a-Second-Language Education</option>
                            <option value="English/Language Arts Education">English/Language Arts Education</option>
                            <option value="Foreign Languages Education">Foreign Languages Education</option>
                            <option value="Health Education">Health Education</option>
                            <option value="Mathematics Education">Mathematics Education</option>
                            <option value="Music Education">Music Education</option>
                            <option value="Physical Education & Coaching">Physical Education & Coaching</option>
                            <option value="Science Education">Science Education</option>
                            <option value="Social Studies/Sciences Education">Social Studies/Sciences Education</option>
                            <option value="Engineering (Pre-Engineering), General">Engineering (Pre-Engineering), General</option>
                            <option value="Aerospace/Aeronautical Engineering">Aerospace/Aeronautical Engineering</option>
                            <option value="Agricultural/Bioengineering">Agricultural/Bioengineering</option>
                            <option value="Architectural Engineering">Architectural Engineering</option>
                            <option value="Biomedical Engineering">Biomedical Engineering</option>
                            <option value="Chemical Engineering">Chemical Engineering</option>
                            <option value="Civil Engineering">Civil Engineering</option>
                            <option value="Computer Engineering">Computer Engineering</option>
                            <option value="Construction Engineering/Management">Construction Engineering/Management</option>
                            <option value="Electrical, Electronics & Communications Engineering">Electrical, Electronics & Communications Engineering</option>
                            <option value="Environmental Health Engineering">Environmental Health Engineering</option>
                            <option value="Industrial Engineering">Industrial Engineering</option>
                            <option value="Mechanical Engineering">Mechanical Engineering</option>
                            <option value="Nuclear Engineering">Nuclear Engineering</option>
                            <option value="Drafting/CAD Technology, General">Drafting/CAD Technology, General</option>
                            <option value="Architectural Drafting/CAD Technology">Architectural Drafting/CAD Technology</option>
                            <option value="Mechanical Drafting/CAD Technology">Mechanical Drafting/CAD Technology</option>
                            <option value="Engineering Technology, General">Engineering Technology, General</option>
                            <option value="Aeronautical/Aerospace Engineering Technologies">Aeronautical/Aerospace Engineering Technologies</option>
                            <option value="Architectural Engineering Technology">Architectural Engineering Technology</option>
                            <option value="Automotive Engineering Technology">Automotive Engineering Technology</option>
                            <option value="Civil Engineering Technology">Civil Engineering Technology</option>
                            <option value="Computer Engineering Technology">Computer Engineering Technology</option>
                            <option value="Construction/Building Technology">Construction/Building Technology</option>
                            <option value="Electrical, Electronics Engineering Technologies">Electrical, Electronics Engineering Technologies</option>
                            <option value="Electromechanical/Biomedical Engineering Technologies">Electromechanical/Biomedical Engineering Technologies</option>
                            <option value="Environmental Control Technologies">Environmental Control Technologies</option>
                            <option value="Industrial Production Technologies">Industrial Production Technologies</option>
                            <option value="Mechanical Engineering Technology">Mechanical Engineering Technology</option>
                            <option value="Quality Control & Safety Technologies">Quality Control & Safety Technologies</option>
                            <option value="Surveying Technology">Surveying Technology</option>
                            <option value="English Language & Literature, General">English Language & Literature, General</option>
                            <option value="American/English Literature">American/English Literature</option>
                            <option value="Creative Writing">Creative Writing</option>
                            <option value="Public Speaking">Public Speaking</option>
                            <option value="Foreign Languages/Literatures, General">Foreign Languages/Literatures, General</option>
                            <option value="Asian Languages & Literatures">Asian Languages & Literatures</option>
                            <option value="Classical/Ancient Languages & Literatures">Classical/Ancient Languages & Literatures</option>
                            <option value="Comparative Literature">Comparative Literature</option>
                            <option value="French Language & Literature">French Language & Literature</option>
                            <option value="German Language & Literature">German Language & Literature</option>
                            <option value="Linguistics">Linguistics</option>
                            <option value="Middle Eastern Languages & Literatures">Middle Eastern Languages & Literatures</option>
                            <option value="Spanish Language & Literature">Spanish Language & Literature</option>
                            <option value="Health Services Administration,General">Health Services Administration,General</option>
                            <option value="Hospital/Facilities Administration">Hospital/Facilities Administration</option>
                            <option value="Medical Office/Secretarial">Medical Office/Secretarial</option>
                            <option value="Medical Records">Medical Records</option>
                            <option value="Medical/Clinical Assisting, General">Medical/Clinical Assisting, General</option>
                            <option value="Dental Assisting">Dental Assisting</option>
                            <option value="Medical Assisting">Medical Assisting</option>
                            <option value="Occupational Therapy Assisting">Occupational Therapy Assisting</option>
                            <option value="Physical Therapy Assisting">Physical Therapy Assisting</option>
                            <option value="Veterinarian Assisting/Technology">Veterinarian Assisting/Technology</option>
                            <option value="Chiropractic (Pre-Chiropractic)">Chiropractic (Pre-Chiropractic)</option>
                            <option value="Dental Hygiene">Dental Hygiene</option>
                            <option value="Dentistry (Pre-Dentistry)">Dentistry (Pre-Dentistry)</option>
                            <option value="Emergency Medical Technology">Emergency Medical Technology</option>
                            <option value="Health-Related Professions & Services, General*">Health-Related Professions & Services, General*</option>
                            <option value="Athletic Training">Athletic Training</option>
                            <option value="Communication Disorder Services (e.g., Speech Pathology)">Communication Disorder Services (e.g., Speech Pathology)</option>
                            <option value="Public Health">Public Health</option>
                            <option value="Health/Medical Technology, General">Health/Medical Technology, General</option>
                            <option value="Medical Laboratory Technology">Medical Laboratory Technology</option>
                            <option value="Medical Radiologic Technology">Medical Radiologic Technology</option>
                            <option value="Nuclear Medicine Technology">Nuclear Medicine Technology</option>
                            <option value="Respiratory Therapy Technology">Respiratory Therapy Technology</option>
                            <option value="Surgical Technology">Surgical Technology</option>
                            <option value="Medicine (Pre-Medicine)">Medicine (Pre-Medicine)</option>
                            <option value="Nursing, Practical/Vocational (LPN)">Nursing, Practical/Vocational (LPN)</option>
                            <option value="Nursing, Registered (BS/RN)">Nursing, Registered (BS/RN)</option>
                            <option value="Optometry (Pre-Optometry)">Optometry (Pre-Optometry)</option>
                            <option value="Osteopathic Medicine">Osteopathic Medicine</option>
                            <option value="Pharmacy (Pre-Pharmacy)">Pharmacy (Pre-Pharmacy)</option>
                            <option value="Physician Assisting">Physician Assisting</option>
                            <option value="Therapy & Rehabilitation, General">Therapy & Rehabilitation, General</option>
                            <option value="Alcohol/Drug Abuse Counseling">Alcohol/Drug Abuse Counseling</option>
                            <option value="Massage Therapy">Massage Therapy</option>
                            <option value="Mental Health Counseling">Mental Health Counseling</option>
                            <option value="Occupational Therapy">Occupational Therapy</option>
                            <option value="Physical Therapy (Pre-Physical Therapy)">Physical Therapy (Pre-Physical Therapy)</option>
                            <option value="Psychiatric/Mental Health Technician">Psychiatric/Mental Health Technician</option>
                            <option value="Rehabilitation Therapy">Rehabilitation Therapy</option>
                            <option value="Vocational Rehabilitation Counseling">Vocational Rehabilitation Counseling</option>
                            <option value="Veterinary Medicine (Pre-Veterinarian)">Veterinary Medicine (Pre-Veterinarian)</option>
                            <option value="Philosophy">Philosophy</option>
                            <option value="Religion">Religion</option>
                            <option value="Theology, General">Theology, General</option>
                            <option value="Bible/Biblical Studies">Bible/Biblical Studies</option>
                            <option value="Divinity/Ministry">Divinity/Ministry</option>
                            <option value="Religious Education">Religious Education</option>
                            <option value="Aviation & Airway Science, General">Aviation & Airway Science, General</option>
                            <option value="Aircraft Piloting & Navigation">Aircraft Piloting & Navigation</option>
                            <option value="Aviation Management & Operations">Aviation Management & Operations</option>
                            <option value="Construction Trades (e.g., carpentry, plumbing, electrical)">Construction Trades (e.g., carpentry, plumbing, electrical)</option>
                            <option value="Mechanics & Repairers, General">Mechanics & Repairers, General</option>
                            <option value="Aircraft Mechanics/Technology">Aircraft Mechanics/Technology</option>
                            <option value="Autobody Repair/Technology">Autobody Repair/Technology</option>
                            <option value="Automotive Mechanics/Technology">Automotive Mechanics/Technology</option>
                            <option value="Avionics Technology">Avionics Technology</option>
                            <option value="Diesel Mechanics/Technology">Diesel Mechanics/Technology</option>
                            <option value="Electrical/Electronics Equip Installation & Repair">Electrical/Electronics Equip Installation & Repair</option>
                            <option value="Heating/Air Cond/Refrig Install/Repair">Heating/Air Cond/Refrig Install/Repair</option>
                            <option value="Precision Production Trades, General">Precision Production Trades, General</option>
                            <option value="Machine Tool Technology">Machine Tool Technology</option>
                            <option value="Welding Technology">Welding Technology</option>
                            <option value="Transportation & Materials Moving (e.g., air, ground, & marine)">Transportation & Materials Moving (e.g., air, ground, & marine)</option>
                            <option value="Biology, General">Biology, General</option>
                            <option value="Biochemistry & Biophysics">Biochemistry & Biophysics</option>
                            <option value="Cell/Cellular Biology">Cell/Cellular Biology</option>
                            <option value="Ecology">Ecology</option>
                            <option value="Genetics">Genetics</option>
                            <option value="Marine/Aquatic Biology">Marine/Aquatic Biology</option>
                            <option value="Microbiology & Immunology">Microbiology & Immunology</option>
                            <option value="Zoology">Zoology</option>
                            <option value="Physical Sciences, General">Physical Sciences, General</option>
                            <option value="Astronomy">Astronomy</option>
                            <option value="Atmospheric Sciences & Meteorology">Atmospheric Sciences & Meteorology</option>
                            <option value="Chemistry">Chemistry</option>
                            <option value="Geological & Earth Sciences">Geological & Earth Sciences</option>
                            <option value="Physics">Physics</option>
                            <option value="Legal Studies, General*">Legal Studies, General*</option>
                            <option value="Court Reporting*">Court Reporting*</option>
                            <option value="Law (Pre-Law)">Law (Pre-Law)</option>
                            <option value="Legal Administrative Assisting/Secretarial*">Legal Administrative Assisting/Secretarial*</option>
                            <option value="Paralegal/Legal Assistant">Paralegal/Legal Assistant</option>
                            <option value="Social Sciences, General">Social Sciences, General</option>
                            <option value="Anthropology">Anthropology</option>
                            <option value="Criminology">Criminology</option>
                            <option value="Economics">Economics</option>
                            <option value="Geography">Geography</option>
                            <option value="History">History</option>
                            <option value="International Relations & Affairs">International Relations & Affairs</option>
                            <option value="Political Science & Government">Political Science & Government</option>
                            <option value="Psychology, Clinical & Counseling">Psychology, Clinical & Counseling</option>
                            <option value="Psychology, General">Psychology, General</option>
                            <option value="Sociology">Sociology</option>
                            <option value="Urban Studies/Urban Affairs">Urban Studies/Urban Affairs</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="layui-badge-dot"></span>申请使用成绩</label>
                    <div class="layui-input-block">
                        <button class="layui-btn" id="btn_addScore">添加/编辑成绩</button>
                        <input type="hidden" name="">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">奖学金数额</label>
                    <div class="layui-input-block">
                        <input type="number" name="title" lay-verify="title" autocomplete="off" placeholder="$"
                               class="layui-input" v-model="returnData.stucollegescholarship">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">校友关系</label>
                    <div class="layui-input-block">
                        <textarea id="add_alumni" class="layui-textarea" v-model="returnData.stucollegealumnirelation"></textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">自我感想</label>
                    <div class="layui-input-block">
                        <textarea id="add_feel" class="layui-textarea" v-model="returnData.stucollegeselffeeling"></textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">文书</label>
                    <div class="layui-input-block">
                        <textarea id="add_essay" style="display: none;"  style="display: none"></textarea>
                    </div>
                </div>

            <hr>
            <div style="text-align: center">
                <button class="layui-btn layui-btn-normal" @click="insertIntoStuCollegeSelective" id="btn_submit">提交</button>
            </div>

        </div>


        <div class="modal fade" aria-hidden="true" id="modal_addScore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"id="modal_edit_label"style="">添加成绩</h4>
                    </div>
                    <div class="modal-body">
                        <table class="layui-table">
                            <colgroup>
                                <col width="50">
                                <col width="300">
                                <col width="300">
                                <col width="300">
                                <col width="400">
                                <col width="50">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>考试名称</th>
                                <th>科目名称</th>
                                <th>分数</th>
                                <th>日期</th>
                                <th>添加</th>
                            </tr>
                            </thead>
                            <tbody id="tbody_addScore">

                            </tbody>
                        </table>

                    </div>
                    <div class="modal-footer">
                        <button type="button"class="layui-btn" id="btn_modelConfirm">确认添加</button>
                        <button type="button"class="layui-btn layui-btn-primary" data-dismiss="modal">关闭</button>
                    </div>
                </div><!--/.modal-content-->
            </div><!--/.modal-->
        </div>

    </div>
</body>
<script>
    var collegeNew = new Vue({
        el:"#maindiv",
        data:{
            collegeName:"",
            returnList:"",
            ReviseSuccess1:false,
            returnData:{
                stucollegeid:this.collegeId,
                stucollegemajor:"",
                stucollegescholarship:"",
                stucollegealumnirelation:"",
                stucollegeselffeeling:"",
                stucollegedistinctessayurl:"",
                stucollegescoreid:""
            },
            collegeId:""
        },
        methods:{
            typeAddCollege:function () {

                $.ajax({
                    url:"/college/selectByName",
                    method:"post",
                    data:{"collegename":collegeNew.collegeName},
                    datatype:"json",
                    success:function (data) {
                        addDiv_College("div_search",data);
                        addCollege();
                    }
                })
            },
            addDiv_empty:function () {
                $("#div_search").empty();
                this.collegeName = "";
            },
            insertIntoStuCollegeSelective:function () {
                this.returnData.stucollegescoreid=this.returnScore;
                this.returnData.collegeid=collegeNew.collegeId;
                this.returnData.stucollegemajor = $("#select_major").val();
                setTimeout(function () {
                    $.ajax({
                        url:"/stuCollege/insertIntoStuCollegeSelective",
                        method:"post",
                        datatype:"json",
                        data:collegeNew.returnData,
                        success:function (index) {
                            if(index==1)
                            {
                                collegeNew.ReviseSuccess1 = true;
                                setTimeout(collegeNew.hideSuccess,3000);
                                collegeNew.returnData = {};
                                collegeNew.collegeName="";
                            }
                        }
                    })
                },100);
            },
            hideSuccess:function () {
                this.ReviseSuccess1 = false;
            },
        }
    })
</script>
<script>
    let queryTime = 0;
    function addCollege() {
        $("input[name='btn_college_add']").click(function () {
            var collegeName_selected =$(this).attr("value");
            collegeNew.collegeId=$(this).attr("id");
            collegeNew.collegeName = collegeName_selected;
            $("#div_search").empty();
        })
    }
    $(function () {
        $("#btn_addScore").click(function () {
            $(this).attr("data-toggle","modal").attr("data-target","#modal_addScore");
        })
    })
    function queryall() {
        $.ajax({
            url:"/stuInfo/selectStuScoreByStuId",
            datatype:"json",
            method:"post",
            success:function (data) {
                addTab_Score2("tbody_addScore",data);
            }
        })
    }
    $(function () {
        $("#btn_addScore").click(function () {
            if(queryTime==0)
            {
                queryall();
                queryTime++;
            }
        })
    })
    $(function () {
        $("#btn_modelConfirm").click(function () {
            collegeNew.returnScore = "";
            $("input[name='checkbox_addScore']").each(function () {
                if($(this).prop("checked"))
                {
                    var scoreId = $(this).parent().parent().children(":first").html();
                    collegeNew.returnScore+=scoreId+"-";
                }
            })
            $("#modal_addScore").modal("hide");
        })
    })
</script>
<script>
    let indexs
    //Demo
    layui.use('form', function () {
        var form = layui.form;

    });
    layui.use('layedit', function(){
        var layedit = layui.layedit;
        var $ = layui.$;
        indexs = layedit.build('add_essay'); //建立编辑器

        $("#btn_submit").click(function () {
            collegeNew.returnData.stucollegedistinctessayurl = layedit.getContent(indexs);
            layedit.sync(indexs);
        })

    });
</script>
</html>
