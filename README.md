# Pewlett-Hackard-Analysis
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><strong><u><span style="font-size: 18px;">Project Summary:</span></u></strong></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:18px;font-family:&quot;Calibri&quot;,sans-serif;">The goal of this project was to identify employees that are ready for mentor.&nbsp; ERD.png has the data relationship diagram</p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;">Total number of individuals retiring are &nbsp; &nbsp; 71193</p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;">Total number of individuals hired are &nbsp; &nbsp; 300024</p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;">Total number of individuals available for mentorship are &nbsp; &nbsp; 1549</p>
<br>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><B>Suggestion for future analysis:</B> The next analysis should consist of realted fields and individuals with specific designation for mentor. We can also analyse the trend for positions that individuals are going through during their career and HR could use that data for designing career growth pathways. </p>

<h4 style="margin: 20px 0px 15px; font-family: Raleway, sans-serif; font-weight: 800; line-height: 1; text-rendering: optimizelegibility; font-size: 1.5em; color: var(--primary); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;"><span style="font-family: Calibri, sans-serif; font-size: 14px;"><u>Number Retiring</u></span></h4>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;">I first found all the employees that are at the age of retiring. For this the filters used are birthdate and current employees.</span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;"><strong>NOTE:</strong></span><em><span style="font-size: 14px;">&nbsp;I have not used hire date filter used in module 7.3.1 . My understanding is the module was teaching us how to add multiple filters and there is no information given in this reference in the challenge.</span></em></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><strong><span style="font-size: 14px;">Query:</span></strong></p>
<pre style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;">SELECT&nbsp;
            e.emp_no,
            e.first_name,
            e.last_name,
            t.title,
            t.from_date,
            s.salary
INTO emp_title_sal         
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN title as t
ON (t.emp_no = e.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE 
(e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (de.to_date = '9999-01-01');</span></pre>
<p style="margin-top:0in;margin-right:0in;margin-bottom:.0001pt;margin-left:0in;line-height:normal;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;">
    <br>
  </span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;">Sample data extract from this query</span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;">
  <img width="624" src="1.png">
</p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;">
  <br>
</p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><strong><span style="font-size: 14px;">Observation</span></strong><span style="font-size: 14px;">:&nbsp;</span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;">The data filtered retirement eligible employees but they showed duplicates.</span></p>
<h4 style="margin: 20px 0px 15px; font-family: Raleway, sans-serif; font-weight: 800; line-height: 1; text-rendering: optimizelegibility; font-size: 1.5em; color: var(--primary); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;"><span style="font-family: Calibri, sans-serif; font-size: 14px;"><u>Only the Most Recent Titles</u></span></h4>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;">To avoid duplicate entries, I picked the most recent title of each employee. Used Over &amp; Partition By options.</span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;">Query:</span></p>
<pre style="margin-top:0in;margin-right:0in;margin-bottom:.0001pt;margin-left:0in;line-height:normal;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;">SELECT emp_no, first_name, last_name, from_date, title into emp_recent_titles FROM</span><span style="font-size: 14px;">(SELECT emp_no, first_name, last_name, from_date, title,</span><span style="font-size: 14px;">ROW_NUMBER() OVER</span><span style="font-size: 14px;">(PARTITION BY (first_name, last_name) ORDER BY from_date DESC) rn</span><span style="font-size: 14px;">FROM emp_title_sal</span><span style="font-size: 14px;">) tmp WHERE rn = 1</span><span style="font-size: 14px;">ORDER BY 1;</span></pre>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;"><strong>Sample data set</strong></span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;">
  <img width="624" src="2.png">
</p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;">This query is written on the first table I created which is emp_title_sal so we already have filtered data for retirees. Here we have removed the duplicates.</span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;"><strong><u>Ready for a Mentor</u></strong></span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;">Finally, I had to find employees with birthdate in the year of 65 to identify who is ready for a Mentor. I have added a filter on the birthdate</span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-size: 14px;">Query is</span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-family: Calibri, sans-serif; font-size: 14px;">SELECT emp_no, first_name, last_name, from_date, to_date, title
    <br>INTO emp_mentors FROM
    <br>(SELECT e.emp_no, first_name, last_name, t.from_date, t.to_date, title,
    <br>ROW_NUMBER() OVER
    <br>(PARTITION BY (first_name, last_name) ORDER BY t.from_date DESC) rn
    <br>FROM employees as e
    <br>INNER JOIN title as t
    <br>ON (t.emp_no = e.emp_no)
    <br>INNER JOIN dept_emp as de
    <br>ON (e.emp_no = de.emp_no)
    <br>WHERE
    <br>(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    <br>AND (de.to_date = '9999-01-01')
    <br>) tmp WHERE rn = 1
    <br>&nbsp;ORDER BY 1;
  </span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:.0001pt;margin-left:0in;line-height:normal;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-family: Calibri, sans-serif; font-size: 14px;"><strong>Sample Data:</strong></span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:.0001pt;margin-left:0in;line-height:normal;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;">
  <img width="624" src="3.png">
</p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:.0001pt;margin-left:0in;line-height:normal;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;"><span style="font-family:&quot;Courier New&quot;;">&nbsp;</span></p>
<p style="margin-top:0in;margin-right:0in;margin-bottom:8.0pt;margin-left:0in;line-height:107%;font-size:15px;font-family:&quot;Calibri&quot;,sans-serif;">&nbsp;</p>
