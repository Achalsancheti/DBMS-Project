select * from Customer;

INSERT INTO Customer VALUES(1,"Perez","Mary","Margaret","1981/11/5",11,"Female",441104,"mpereza@senate.gov",34,11);

INSERT INTO Customer VALUES(2,"Dixon","Ryan","Roy","1992/11/21",12,"Male",351762,"rdionb@pwire.com",23,12);

INSERT INTO Customer VALUES(3,"Burke","Justin","Jason","1996/12/18",13,"Male",865495,"jburkec@opera.com",19,13);

INSERT INTO Customer VALUES(4,"Marshall","Julia","Norma","1996/8/25",14,"Female",604396,"nmars@abc.net.au",19,14);

INSERT INTO Customer VALUES(5,"Hawkins","Juan","Howard","1995/5/10",15,"Male",606949,"hinse@usatoday.com",20,15);

INSERT INTO Customer VALUES(6,"Kelly","Sean","Edward","1982/11/5",16,"Male",253028,"eke@busisweek.com",33,16);

INSERT INTO Customer VALUES(7,"Rodriguez","Sarah","Margaret","1986/10/28",17,"Female",921313,"mrezg@cisco.com",29,17);

INSERT INTO Customer VALUES(8,"Ferguson","Amanda","Rachel","1991/8/4",18,"Female",585349,"rfnh@anire.com",24,18);

INSERT INTO Customer VALUES(9,"Myers","Phillip","Billy","1991/3/6",19,"Male",160623,"bmsi@wp.com",24,19);

INSERT INTO Customer VALUES(10,"Torres","Doris","Brenda","1990/3/25",20,"Female",346726,"btorj@unc.edu",25,20);

INSERT INTO Customer VALUES(11,"Thomas","Michelle","Robin","1983/12/21",21,"Female",657963,"rthok@ox.ac.uk",32,21);

INSERT INTO Customer VALUES(12,"Garcia","Jose","Howard","1980/12/9",22,"Male",625242,"hgal@ycombinator.com",35,22);

INSERT INTO Customer VALUES(13,"Shaw","Helen","Kathy","1990/5/10",23,"Female",976909,"ksm@eepurl.com",25,23);

INSERT INTO Customer VALUES(14,"Thompson","Lois","Anna","1998/4/15",24,"Female",630549,"athonn@weather.com",17,24);

INSERT INTO Customer VALUES(15,"Bishop","Billy","Roy","1984/1/8",25,"Male",956621,"rbopo@wundend.com",31,25);

INSERT INTO Customer VALUES(16,"Jones","Peter","Larry","1997/11/16",26,"Male",713367,"ljon@meetup.com",18,26);

INSERT INTO Customer VALUES(17,"Franklin","Kevin","George","1997/11/14",27,"Male",463346,"gklinq@trid.com",18,27);

INSERT INTO Customer VALUES(18,"Kennedy","Joshua","Walter","1992/5/25",28,"Male",696897,"wkdyr@state.gov",23,28);

INSERT INTO Customer VALUES(19,"Fuller","Sandra","Susan","1981/5/23",29,"Female",785046,"sfus@pageoorange.fr",34,29);

INSERT INTO Customer VALUES(20,"Schmidt","Anne","Betty","1984/11/3",30,"Female",133492,"bmidtt@nfruit.com",31,30);

INSERT INTO Customer VALUES(21,"Long","Jimmy","Peter","1983/3/2",31,"Male",312962,"pngu@arve.org",32,1);

INSERT INTO Customer VALUES(22,"Turner","Andrea","Anna","1989/1/4",32,"Female",177152,"atuv@ezinees.com",26,2);

INSERT INTO Customer VALUES(23,"Black","Sharon","Patricia","1998/9/14",33,"Female",450607,"ackw@hse.gov",17,3);

INSERT INTO Customer VALUES(24,"Ramirez","Robin","Tina","1980/12/16",34,"Female",808204,"trzx@doarket.com",35,4);

INSERT INTO Customer VALUES(25,"Wright","Johnny","Peter","1984/8/29",35,"Male",942592,"phty@nasa.gov",31,5);

INSERT INTO Customer VALUES(26,"Lane","Roger","Donald","1984/3/6",36,"Male",930911,"dlanez@miian.gov.cn",31,6);

INSERT INTO Customer VALUES(27,"Perry","Adam","Mark","1990/8/14",37,"Male",535194,"mpy10@live.com",25,7);

INSERT INTO Customer VALUES(28,"Ray","Laura","Kelly","1989/11/5",38,"Female",352699,"kr11@omure.com",26,8);

INSERT INTO Customer VALUES(29,"Wheeler","Thomas","Charles","1993/10/24",39,"Male",844675,"celer12@cnel.net",22,9);

INSERT INTO Customer VALUES(30,"Garrett","Edward","Antonio","1982/5/31",40,"Male",630922,"agtt13@mwebster.com",33,10);

Alter table customer
modify column emailId varchar (50);

delete from customer
where customerid=1;