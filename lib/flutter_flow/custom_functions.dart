import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

List<PrioritieModelStruct> fromJsonToModelList(dynamic jsonBody) {
  return jsonBody
      .map((e) => e != null && e != '' ? PrioritieModelStruct.fromMap(e) : null)
      .toList()
      .toList()
      .cast<PrioritieModelStruct>();
}

List<UserModelStruct> addIsSelectedAllTrue(
  List<MemberModelStruct> listOfLocalUserModels,
  List<UserModelStruct> listOfBackendUseres,
) {
  for (var backendUsere in listOfBackendUseres) {
    for (var localUserModels in listOfLocalUserModels) {
      if (backendUsere.id == localUserModels.id) {
        backendUsere.isSelected = true;
      }
    }
  }

  return listOfBackendUseres;
}

String calculateFutureDate(String dateString) {
  DateTime currentDate = DateTime.now();
  DateTime inputDate = DateTime.parse(dateString);

  // Check if the date is in the future and not today
  if (inputDate.isAfter(currentDate) &&
      !(currentDate.year == inputDate.year &&
          currentDate.month == inputDate.month &&
          currentDate.day == inputDate.day)) {
    // Check if the date is tomorrow
    if (inputDate.difference(currentDate).inDays == 1) {
      return "Tomorrow";
    } else {
      // Format the date as "day, month" (e.g., "5, May")
      return DateFormat("d, MMM").format(inputDate);
    }
  } else {
    return DateFormat("d, MMM").format(inputDate);
  }
}

List<MemberModelStruct> getMemberType(
  String seniorName,
  String seniorId,
  String seniorPicture,
  List<MemberModelStruct> midManagers,
  List<MemberModelStruct> associates,
) {
  List<MemberModelStruct> members = [];
  members.add(MemberModelStruct(name: 'Senior'));

  midManagers.forEach((MemberModelStruct age) {
    members.add(MemberModelStruct(name: 'MidManager'));
  });

  midManagers.forEach((MemberModelStruct age) {
    associates.add(MemberModelStruct(name: 'Associates'));
  });

  return members;
}

List<MemberModelStruct> addMidsAndAssositsToRoleListCopy(
  List<MemberModelStruct> listOfMids,
  List<MemberModelStruct> listOfAssosits,
) {
  List<MemberModelStruct> listOf = [];

  listOf.addAll(listOfMids);
  listOf.addAll(listOfAssosits);
  return listOf;
}

List<ProjectModelStruct>? fromProjectJsonToModelList(dynamic jsonBody) {
  return jsonBody
      .map((e) => e != null && e != '' ? ProjectModelStruct.fromMap(e) : null)
      .toList()
      .toList()
      .cast<ProjectModelStruct>();
}

String? getFullImage(String image) {
  if (image == "null" || image == null || image.isEmpty) {
    return "https://api.beyond.matterhr.com/Files/Uploads/82b9c31f-49aa-4c2f-8577-fa13f8698289.jpg";
  } else {
    return "https://api.beyond.matterhr.com/${image}";
  }
}

String? formatLastUpdated(
  String? dateString,
  String? lang,
) {
  if (dateString == null || dateString == 'null' || dateString.isEmpty) {
    return "-"; // or a default value if you prefer
  }

  // Parse the input date string
  DateTime lastUpdated = DateTime.parse(dateString);

  // Get current date and time
  DateTime now = DateTime.now();

  // Check if the date is today
  if (now.year == lastUpdated.year &&
      now.month == lastUpdated.month &&
      now.day == lastUpdated.day) {
    return lang == 'ar' ? 'اخر تعديل اليوم' : 'Last Updated Today';
  }

  // Check if the date is yesterday
  DateTime yesterday = now.subtract(Duration(days: 1));
  if (yesterday.year == lastUpdated.year &&
      yesterday.month == lastUpdated.month &&
      yesterday.day == lastUpdated.day) {
    return lang == 'ar' ? 'اخر تعديل البارحذ' : 'Last Updated Yesterday';
  }

  // Format the date as '11, May' (for example)
  String formattedDate = DateFormat('dd, MMM').format(lastUpdated);
  return lang == 'ar'
      ? 'اخر تعديل $formattedDate'
      : 'Last Updated $formattedDate';
}

double calculateRatio(
  double? profit,
  double? profitPercentage,
) {
  if (profit == null || profitPercentage == null || profitPercentage == 0) {
    return 0; // or handle this case as needed
  }

  double ratio = profit / (profitPercentage / 100);
  return double.parse(ratio.toStringAsFixed(3));
}

String projectTitle(
  String lang,
  int role,
) {
  if (role == 0 || role == 1) {
    return lang == 'ar' ? "كل المشاريع" : "All Projects";
  } else {
    return lang == 'ar' ? "مشاريعي" : "My Projects";
  }
}

List<MemberModelStruct> convertFomrUserToMembersCheck(
    List<UserModelStruct> userList) {
  List<MemberModelStruct> listOfUsers = [];
  for (UserModelStruct item in userList) {
    if (item.isSelected) {
      listOfUsers.add(MemberModelStruct(
          id: item.id,
          firstName: item.firstName,
          lastName: item.lastName,
          isSelected: item.isSelected,
          name: item.firstName));
    }
  }
  return listOfUsers;
}

dynamic getAllCountrJsonArray() {
  return jsonDecode(
      '{"data":[{"nameEn":"Afghanistan","nameAr":"أفغانستان","flag":"https://flagcdn.com/96x72/af.png","code":"AF"},{"nameEn":"Sudan","nameAr":"السودان","flag":"https://flagcdn.com/96x72/sd.png","code":"SD"},{"nameEn":"Burundi","nameAr":"بوروندي","flag":"https://flagcdn.com/96x72/bi.png","code":"BI"},{"nameEn":"Mexico","nameAr":"المسكيك","flag":"https://flagcdn.com/96x72/mx.png","code":"MX"},{"nameEn":"Cuba","nameAr":"كوبا","flag":"https://flagcdn.com/96x72/cu.png","code":"CU"},{"nameEn":"Serbia","nameAr":"صيربيا","flag":"https://flagcdn.com/96x72/rs.png","code":"RS"},{"nameEn":"Monaco","nameAr":"موناكو","flag":"https://flagcdn.com/96x72/mc.png","code":"MC"},{"nameEn":"Bhutan","nameAr":"بوتان","flag":"https://flagcdn.com/96x72/bt.png","code":"BT"},{"nameEn":"Guyana","nameAr":"غيانا","flag":"https://flagcdn.com/96x72/gy.png","code":"GY"},{"nameEn":"South Georgia","nameAr":"جورجيا الجنوبية","flag":"https://flagcdn.com/96x72/gs.png","code":"GS"},{"nameEn":"Bosnia and Herzegovina","nameAr":"البوسنة والهرسك","flag":"https://flagcdn.com/96x72/ba.png","code":"BA"},{"nameEn":"Brunei","nameAr":"بروناي","flag":"https://flagcdn.com/96x72/bn.png","code":"BN"},{"nameEn":"Pakistan","nameAr":"باكستان","flag":"https://flagcdn.com/96x72/pk.png","code":"PK"},{"nameEn":"Kenya","nameAr":"كينيا","flag":"https://flagcdn.com/96x72/ke.png","code":"KE"},{"nameEn":"Puerto Rico","nameAr":"بويرتوريكو","flag":"https://flagcdn.com/96x72/pr.png","code":"PR"},{"nameEn":"Somalia","nameAr":"الصومال","flag":"https://flagcdn.com/96x72/so.png","code":"SO"},{"nameEn":"Svalbard and Jan Mayen","nameAr":"سفالبارد ويان ماين","flag":"https://flagcdn.com/96x72/sj.png","code":"SJ"},{"nameEn":"Sierra Leone","nameAr":"سيراليون","flag":"https://flagcdn.com/96x72/sl.png","code":"SL"},{"nameEn":"French Polynesia","nameAr":"بولينزيا الفرنسية","flag":"https://flagcdn.com/96x72/pf.png","code":"PF"},{"nameEn":"Azerbaijan","nameAr":"أذربيجان","flag":"https://flagcdn.com/96x72/az.png","code":"AZ"},{"nameEn":"Cook Islands","nameAr":"جزر كوك","flag":"https://flagcdn.com/96x72/ck.png","code":"CK"},{"nameEn":"Peru","nameAr":"بيرو","flag":"https://flagcdn.com/96x72/pe.png","code":"PE"},{"nameEn":"Bouvet Island","nameAr":"جزر بوفيه","flag":"https://flagcdn.com/96x72/bv.png","code":"BV"},{"nameEn":"Northern Mariana Islands","nameAr":"جزر ماريانا الشمالية","flag":"https://flagcdn.com/96x72/mp.png","code":"MP"},{"nameEn":"Angola","nameAr":"جمهورية أنغولا","flag":"https://flagcdn.com/96x72/ao.png","code":"AO"},{"nameEn":"Republic of the Congo","nameAr":"جمهورية الكونفو","flag":"https://flagcdn.com/96x72/cg.png","code":"CG"},{"nameEn":"South Sudan","nameAr":"جنوب السودان","flag":"https://flagcdn.com/96x72/ss.png","code":"SS"},{"nameEn":"Saint Martin","nameAr":"سانت مارتن","flag":"https://flagcdn.com/96x72/mf.png","code":"MF"},{"nameEn":"Turkey","nameAr":"تركيا","flag":"https://flagcdn.com/96x72/tr.png","code":"TR"},{"nameEn":"Anguilla","nameAr":"أنغويلا","flag":"https://flagcdn.com/96x72/ai.png","code":"AI"},{"nameEn":"Saint Kitts and Nevis","nameAr":"سانت كيتس ونيفيس","flag":"https://flagcdn.com/96x72/kn.png","code":"KN"},{"nameEn":"Aruba","nameAr":"أروبا","flag":"https://flagcdn.com/96x72/aw.png","code":"AW"},{"nameEn":"Turks and Caicos Islands","nameAr":"جزر توركس وكايكوس","flag":"https://flagcdn.com/96x72/tc.png","code":"TC"},{"nameEn":"Taiwan","nameAr":"تايوان","flag":"https://flagcdn.com/96x72/tw.png","code":"TW"},{"nameEn":"Sweden","nameAr":"السويد","flag":"https://flagcdn.com/96x72/se.png","code":"SE"},{"nameEn":"Liberia","nameAr":"ليبيريا","flag":"https://flagcdn.com/96x72/lr.png","code":"LR"},{"nameEn":"Venezuela","nameAr":"فنزويلا","flag":"https://flagcdn.com/96x72/ve.png","code":"VE"},{"nameEn":"United States Virgin Islands","nameAr":"جزر العذراء الامريكية","flag":"https://flagcdn.com/96x72/vi.png","code":"VI"},{"nameEn":"Bermuda","nameAr":"برمودا","flag":"https://flagcdn.com/96x72/bm.png","code":"BM"},{"nameEn":"Albania","nameAr":"ألبانيا","flag":"https://flagcdn.com/96x72/al.png","code":"AL"},{"nameEn":"Hong Kong","nameAr":"هونغ كونغ","flag":"https://flagcdn.com/96x72/hk.png","code":"HK"},{"nameEn":"Luxembourg","nameAr":"لوكسمبورغ","flag":"https://flagcdn.com/96x72/lu.png","code":"LU"},{"nameEn":"Eritrea","nameAr":"إريتريا","flag":"https://flagcdn.com/96x72/er.png","code":"ER"},{"nameEn":"Colombia","nameAr":"كولومبيا","flag":"https://flagcdn.com/96x72/co.png","code":"CO"},{"nameEn":"Caribbean Netherlands","nameAr":"الجزر الكاريبية الهولندية","flag":"https://flagcdn.com/96x72/bq.png","code":"BQ"},{"nameEn":"Mongolia","nameAr":"منغوليا","flag":"https://flagcdn.com/96x72/mn.png","code":"MN"},{"nameEn":"Yemen","nameAr":"اليمن","flag":"https://flagcdn.com/96x72/ye.png","code":"YE"},{"nameEn":"Lebanon","nameAr":"لبنان","flag":"https://flagcdn.com/96x72/lb.png","code":"LB"},{"nameEn":"Antigua and Barbuda","nameAr":"أنتيغوا وباربودا","flag":"https://flagcdn.com/96x72/ag.png","code":"AG"},{"nameEn":"Vietnam","nameAr":"فيتنام","flag":"https://flagcdn.com/96x72/vn.png","code":"VN"},{"nameEn":"Palau","nameAr":"بالاو","flag":"https://flagcdn.com/96x72/pw.png","code":"PW"},{"nameEn":"Jersey","nameAr":"جيرزي","flag":"https://flagcdn.com/96x72/je.png","code":"JE"},{"nameEn":"Trinidad and Tobago","nameAr":"ترينيداد وتوباغو","flag":"https://flagcdn.com/96x72/tt.png","code":"TT"},{"nameEn":"Bulgaria","nameAr":"بلغاريا","flag":"https://flagcdn.com/96x72/bg.png","code":"BG"},{"nameEn":"Portugal","nameAr":"البرتغال","flag":"https://flagcdn.com/96x72/pt.png","code":"PT"},{"nameEn":"Gibraltar","nameAr":"جبل طارق","flag":"https://flagcdn.com/96x72/gi.png","code":"GI"},{"nameEn":"San Marino","nameAr":"سان مارينو","flag":"https://flagcdn.com/96x72/sm.png","code":"SM"},{"nameEn":"Singapore","nameAr":"سنغافورة","flag":"https://flagcdn.com/96x72/sg.png","code":"SG"},{"nameEn":"Sint Maarten","nameAr":"سينت مارتن","flag":"https://flagcdn.com/96x72/sx.png","code":"SX"},{"nameEn":"Saudi Arabia","nameAr":"السعودية","flag":"https://flagcdn.com/96x72/sa.png","code":"SA"},{"nameEn":"Ghana","nameAr":"غانا","flag":"https://flagcdn.com/96x72/gh.png","code":"GH"},{"nameEn":"Moldova","nameAr":"مولدوڤا","flag":"https://flagcdn.com/96x72/md.png","code":"MD"},{"nameEn":"Chad","nameAr":"تشاد","flag":"https://flagcdn.com/96x72/td.png","code":"TD"},{"nameEn":"Antarctica","nameAr":"أنتارتيكا","flag":"https://flagcdn.com/96x72/aq.png","code":"AQ"},{"nameEn":"United Kingdom","nameAr":"المملكة المتحدة","flag":"https://flagcdn.com/96x72/gb.png","code":"GB"},{"nameEn":"Papua New Guinea","nameAr":"بابوا غينيا الجديدة","flag":"https://flagcdn.com/96x72/pg.png","code":"PG"},{"nameEn":"French Southern and Antarctic Lands","nameAr":"أراض فرنسية جنوبية وأنتارتيكية","flag":"https://flagcdn.com/96x72/tf.png","code":"TF"},{"nameEn":"United States Minor Outlying Islands","nameAr":"جزر الولايات المتحدة الصغيرة النائية","flag":"https://flagcdn.com/96x72/um.png","code":"UM"},{"nameEn":"Belize","nameAr":"بليز","flag":"https://flagcdn.com/96x72/bz.png","code":"BZ"},{"nameEn":"Comoros","nameAr":"جزر القمر","flag":"https://flagcdn.com/96x72/km.png","code":"KM"},{"nameEn":"Burkina Faso","nameAr":"بوركينا فاسو","flag":"https://flagcdn.com/96x72/bf.png","code":"BF"},{"nameEn":"Faroe Islands","nameAr":"جزر فارو","flag":"https://flagcdn.com/96x72/fo.png","code":"FO"},{"nameEn":"Guinea","nameAr":"غينيا","flag":"https://flagcdn.com/96x72/gn.png","code":"GN"},{"nameEn":"India","nameAr":"الهند","flag":"https://flagcdn.com/96x72/in.png","code":"IN"},{"nameEn":"Curaçao","nameAr":"كوراساو","flag":"https://flagcdn.com/96x72/cw.png","code":"CW"},{"nameEn":"Togo","nameAr":"توغو","flag":"https://flagcdn.com/96x72/tg.png","code":"TG"},{"nameEn":"Tunisia","nameAr":"تونس","flag":"https://flagcdn.com/96x72/tn.png","code":"TN"},{"nameEn":"Saint Barthélemy","nameAr":"سان بارتليمي","flag":"https://flagcdn.com/96x72/bl.png","code":"BL"},{"nameEn":"Indonesia","nameAr":"إندونيسيا","flag":"https://flagcdn.com/96x72/id.png","code":"ID"},{"nameEn":"Micronesia","nameAr":"ميكرونيسيا","flag":"https://flagcdn.com/96x72/fm.png","code":"FM"},{"nameEn":"Austria","nameAr":"النمسا","flag":"https://flagcdn.com/96x72/at.png","code":"AT"},{"nameEn":"Tajikistan","nameAr":"طاجيكستان","flag":"https://flagcdn.com/96x72/tj.png","code":"TJ"},{"nameEn":"DR Congo","nameAr":"الكونغو","flag":"https://flagcdn.com/96x72/cd.png","code":"CD"},{"nameEn":"Mayotte","nameAr":"مايوت","flag":"https://flagcdn.com/96x72/yt.png","code":"YT"},{"nameEn":"Réunion","nameAr":"لا ريونيون","flag":"https://flagcdn.com/96x72/re.png","code":"RE"},{"nameEn":"Romania","nameAr":"رومانيا","flag":"https://flagcdn.com/96x72/ro.png","code":"RO"},{"nameEn":"Qatar","nameAr":"قطر","flag":"https://flagcdn.com/96x72/qa.png","code":"QA"},{"nameEn":"Lithuania","nameAr":"ليتوانيا","flag":"https://flagcdn.com/96x72/lt.png","code":"LT"},{"nameEn":"China","nameAr":"الصين","flag":"https://flagcdn.com/96x72/cn.png","code":"CN"},{"nameEn":"New Zealand","nameAr":"نيوزيلندا","flag":"https://flagcdn.com/96x72/nz.png","code":"NZ"},{"nameEn":"Norfolk Island","nameAr":"جزيرة نورفولك","flag":"https://flagcdn.com/96x72/nf.png","code":"NF"},{"nameEn":"Mauritania","nameAr":"موريتانيا","flag":"https://flagcdn.com/96x72/mr.png","code":"MR"},{"nameEn":"Uzbekistan","nameAr":"أوزباكستان","flag":"https://flagcdn.com/96x72/uz.png","code":"UZ"},{"nameEn":"Finland","nameAr":"فنلندا","flag":"https://flagcdn.com/96x72/fi.png","code":"FI"},{"nameEn":"Cameroon","nameAr":"الكاميرون","flag":"https://flagcdn.com/96x72/cm.png","code":"CM"},{"nameEn":"Heard Island and McDonald Islands","nameAr":"جزيرة هيرد وجزر ماكدونالد","flag":"https://flagcdn.com/96x72/hm.png","code":"HM"},{"nameEn":"Dominica","nameAr":"دومينيكا","flag":"https://flagcdn.com/96x72/dm.png","code":"DM"},{"nameEn":"Iceland","nameAr":"آيسلندا","flag":"https://flagcdn.com/96x72/is.png","code":"IS"},{"nameEn":"Oman","nameAr":"عمان","flag":"https://flagcdn.com/96x72/om.png","code":"OM"},{"nameEn":"North Macedonia","nameAr":"شمال مقدونيا","flag":"https://flagcdn.com/96x72/mk.png","code":"MK"},{"nameEn":"Liechtenstein","nameAr":"ليختنشتاين","flag":"https://flagcdn.com/96x72/li.png","code":"LI"},{"nameEn":"Spain","nameAr":"إسبانيا","flag":"https://flagcdn.com/96x72/es.png","code":"ES"},{"nameEn":"Greece","nameAr":"اليونان","flag":"https://flagcdn.com/96x72/gr.png","code":"GR"},{"nameEn":"Paraguay","nameAr":"باراغواي","flag":"https://flagcdn.com/96x72/py.png","code":"PY"},{"nameEn":"Bahrain","nameAr":"‏البحرين","flag":"https://flagcdn.com/96x72/bh.png","code":"BH"},{"nameEn":"Niue","nameAr":"نييوي","flag":"https://flagcdn.com/96x72/nu.png","code":"NU"},{"nameEn":"Senegal","nameAr":"السنغال","flag":"https://flagcdn.com/96x72/sn.png","code":"SN"},{"nameEn":"Montserrat","nameAr":"مونتسرات","flag":"https://flagcdn.com/96x72/ms.png","code":"MS"},{"nameEn":"Latvia","nameAr":"لاتفيا","flag":"https://flagcdn.com/96x72/lv.png","code":"LV"},{"nameEn":"Tokelau","nameAr":"توكيلاو","flag":"https://flagcdn.com/96x72/tk.png","code":"TK"},{"nameEn":"Japan","nameAr":"اليابان","flag":"https://flagcdn.com/96x72/jp.png","code":"JP"},{"nameEn":"Central African Republic","nameAr":"جمهورية أفريقيا الوسطى","flag":"https://flagcdn.com/96x72/cf.png","code":"CF"},{"nameEn":"Gabon","nameAr":"الغابون","flag":"https://flagcdn.com/96x72/ga.png","code":"GA"},{"nameEn":"Iraq","nameAr":"العراق","flag":"https://flagcdn.com/96x72/iq.png","code":"IQ"},{"nameEn":"Isle of Man","nameAr":"جزيرة مان","flag":"https://flagcdn.com/96x72/im.png","code":"IM"},{"nameEn":"Myanmar","nameAr":"ميانمار","flag":"https://flagcdn.com/96x72/mm.png","code":"MM"},{"nameEn":"Montenegro","nameAr":"الجبل الاسود","flag":"https://flagcdn.com/96x72/me.png","code":"ME"},{"nameEn":"Nauru","nameAr":"ناورو","flag":"https://flagcdn.com/96x72/nr.png","code":"NR"},{"nameEn":"Vanuatu","nameAr":"فانواتو","flag":"https://flagcdn.com/96x72/vu.png","code":"VU"},{"nameEn":"France","nameAr":"فرنسا","flag":"https://flagcdn.com/96x72/fr.png","code":"FR"},{"nameEn":"Zimbabwe","nameAr":"زيمبابوي","flag":"https://flagcdn.com/96x72/zw.png","code":"ZW"},{"nameEn":"Philippines","nameAr":"الفلبين","flag":"https://flagcdn.com/96x72/ph.png","code":"PH"},{"nameEn":"Slovakia","nameAr":"سلوفاكيا","flag":"https://flagcdn.com/96x72/sk.png","code":"SK"},{"nameEn":"Australia","nameAr":"أستراليا","flag":"https://flagcdn.com/96x72/au.png","code":"AU"},{"nameEn":"Ivory Coast","nameAr":"ساحل العاج","flag":"https://flagcdn.com/96x72/ci.png","code":"CI"},{"nameEn":"British Indian Ocean Territory","nameAr":"إقليم المحيط الهندي البريطاني","flag":"https://flagcdn.com/96x72/io.png","code":"IO"},{"nameEn":"Eswatini","nameAr":"إسواتيني","flag":"https://flagcdn.com/96x72/sz.png","code":"SZ"},{"nameEn":"Rwanda","nameAr":"رواندا","flag":"https://flagcdn.com/96x72/rw.png","code":"RW"},{"nameEn":"Benin","nameAr":"بنين","flag":"https://flagcdn.com/96x72/bj.png","code":"BJ"},{"nameEn":"British Virgin Islands","nameAr":"جزر العذراء","flag":"https://flagcdn.com/96x72/vg.png","code":"VG"},{"nameEn":"Uganda","nameAr":"أوغندا","flag":"https://flagcdn.com/96x72/ug.png","code":"UG"},{"nameEn":"Ireland","nameAr":"أيرلندا","flag":"https://flagcdn.com/96x72/ie.png","code":"IE"},{"nameEn":"Iran","nameAr":"إيران","flag":"https://flagcdn.com/96x72/ir.png","code":"IR"},{"nameEn":"Slovenia","nameAr":"سلوفينيا","flag":"https://flagcdn.com/96x72/si.png","code":"SI"},{"nameEn":"Mali","nameAr":"مالي","flag":"https://flagcdn.com/96x72/ml.png","code":"ML"},{"nameEn":"Switzerland","nameAr":"سويسرا","flag":"https://flagcdn.com/96x72/ch.png","code":"CH"},{"nameEn":"American Samoa","nameAr":"ساموا الأمريكية","flag":"https://flagcdn.com/96x72/as.png","code":"AS"},{"nameEn":"Uruguay","nameAr":"الأوروغواي","flag":"https://flagcdn.com/96x72/uy.png","code":"UY"},{"nameEn":"Guam","nameAr":"غوام","flag":"https://flagcdn.com/96x72/gu.png","code":"GU"},{"nameEn":"Suriname","nameAr":"سورينام","flag":"https://flagcdn.com/96x72/sr.png","code":"SR"},{"nameEn":"Ukraine","nameAr":"أوكرانيا","flag":"https://flagcdn.com/96x72/ua.png","code":"UA"},{"nameEn":"Czechia","nameAr":"التشيك","flag":"https://flagcdn.com/96x72/cz.png","code":"CZ"},{"nameEn":"Honduras","nameAr":"هندوراس","flag":"https://flagcdn.com/96x72/hn.png","code":"HN"},{"nameEn":"Samoa","nameAr":"ساموا","flag":"https://flagcdn.com/96x72/ws.png","code":"WS"},{"nameEn":"Laos","nameAr":"لاوس","flag":"https://flagcdn.com/96x72/la.png","code":"LA"},{"nameEn":"Cape Verde","nameAr":"كابو فيردي","flag":"https://flagcdn.com/96x72/cv.png","code":"CV"},{"nameEn":"Ethiopia","nameAr":"إثيوبيا","flag":"https://flagcdn.com/96x72/et.png","code":"ET"},{"nameEn":"Bangladesh","nameAr":"بنغلاديش","flag":"https://flagcdn.com/96x72/bd.png","code":"BD"},{"nameEn":"Saint Helena, Ascension and Tristan da Cunha","nameAr":"سانت هيلينا وأسينشين وتريستان دا كونا","flag":"https://flagcdn.com/96x72/sh.png","code":"SH"},{"nameEn":"Belarus","nameAr":"بيلاروسيا","flag":"https://flagcdn.com/96x72/by.png","code":"BY"},{"nameEn":"Croatia","nameAr":"كرواتيا","flag":"https://flagcdn.com/96x72/hr.png","code":"HR"},{"nameEn":"Kuwait","nameAr":"الكويت","flag":"https://flagcdn.com/96x72/kw.png","code":"KW"},{"nameEn":"French Guiana","nameAr":"غويانا","flag":"https://flagcdn.com/96x72/gf.png","code":"GF"},{"nameEn":"Morocco","nameAr":"المغرب","flag":"https://flagcdn.com/96x72/ma.png","code":"MA"},{"nameEn":"Russia","nameAr":"روسيا","flag":"https://flagcdn.com/96x72/ru.png","code":"RU"},{"nameEn":"Estonia","nameAr":"إستونيا","flag":"https://flagcdn.com/96x72/ee.png","code":"EE"},{"nameEn":"Sri Lanka","nameAr":"سريلانكا","flag":"https://flagcdn.com/96x72/lk.png","code":"LK"},{"nameEn":"New Caledonia","nameAr":"كاليدونيا الجديدة","flag":"https://flagcdn.com/96x72/nc.png","code":"NC"},{"nameEn":"Poland","nameAr":"بولندا","flag":"https://flagcdn.com/96x72/pl.png","code":"PL"},{"nameEn":"Madagascar","nameAr":"مدغشقر","flag":"https://flagcdn.com/96x72/mg.png","code":"MG"},{"nameEn":"Costa Rica","nameAr":"كوستاريكا","flag":"https://flagcdn.com/96x72/cr.png","code":"CR"},{"nameEn":"El Salvador","nameAr":"السلفادور","flag":"https://flagcdn.com/96x72/sv.png","code":"SV"},{"nameEn":"Macau","nameAr":"ماكاو","flag":"https://flagcdn.com/96x72/mo.png","code":"MO"},{"nameEn":"Andorra","nameAr":"أندورا","flag":"https://flagcdn.com/96x72/ad.png","code":"AD"},{"nameEn":"Italy","nameAr":"إيطاليا","flag":"https://flagcdn.com/96x72/it.png","code":"IT"},{"nameEn":"Namibia","nameAr":"ناميبيا","flag":"https://flagcdn.com/96x72/na.png","code":"NA"},{"nameEn":"Seychelles","nameAr":"سيشل","flag":"https://flagcdn.com/96x72/sc.png","code":"SC"},{"nameEn":"Panama","nameAr":"بنما","flag":"https://flagcdn.com/96x72/pa.png","code":"PA"},{"nameEn":"Haiti","nameAr":"هايتي","flag":"https://flagcdn.com/96x72/ht.png","code":"HT"},{"nameEn":"Argentina","nameAr":"الأرجنتين","flag":"https://flagcdn.com/96x72/ar.png","code":"AR"},{"nameEn":"Niger","nameAr":"النيجر","flag":"https://flagcdn.com/96x72/ne.png","code":"NE"},{"nameEn":"Malawi","nameAr":"مالاوي","flag":"https://flagcdn.com/96x72/mw.png","code":"MW"},{"nameEn":"Pitcairn Islands","nameAr":"جزر بيتكيرن","flag":"https://flagcdn.com/96x72/pn.png","code":"PN"},{"nameEn":"Germany","nameAr":"ألمانيا","flag":"https://flagcdn.com/96x72/de.png","code":"DE"},{"nameEn":"Kiribati","nameAr":"كيريباتي","flag":"https://flagcdn.com/96x72/ki.png","code":"KI"},{"nameEn":"Syria","nameAr":"سوريا","flag":"https://flagcdn.com/96x72/sy.png","code":"SY"},{"nameEn":"Marshall Islands","nameAr":"جزر مارشال","flag":"https://flagcdn.com/96x72/mh.png","code":"MH"},{"nameEn":"Hungary","nameAr":"المجر","flag":"https://flagcdn.com/96x72/hu.png","code":"HU"},{"nameEn":"Cayman Islands","nameAr":"جزر كايمان","flag":"https://flagcdn.com/96x72/ky.png","code":"KY"},{"nameEn":"Denmark","nameAr":"الدنمارك","flag":"https://flagcdn.com/96x72/dk.png","code":"DK"},{"nameEn":"Saint Lucia","nameAr":"سانت لوسيا","flag":"https://flagcdn.com/96x72/lc.png","code":"LC"},{"nameEn":"Bolivia","nameAr":"بوليفيا","flag":"https://flagcdn.com/96x72/bo.png","code":"BO"},{"nameEn":"Djibouti","nameAr":"جيبوتي","flag":"https://flagcdn.com/96x72/dj.png","code":"DJ"},{"nameEn":"South Africa","nameAr":"جنوب أفريقيا","flag":"https://flagcdn.com/96x72/za.png","code":"ZA"},{"nameEn":"Nigeria","nameAr":"نيجيريا","flag":"https://flagcdn.com/96x72/ng.png","code":"NG"},{"nameEn":"São Tomé and Príncipe","nameAr":"ساو تومي وبرينسيب","flag":"https://flagcdn.com/96x72/st.png","code":"ST"},{"nameEn":"Nicaragua","nameAr":"نيكاراغوا","flag":"https://flagcdn.com/96x72/ni.png","code":"NI"},{"nameEn":"Guadeloupe","nameAr":"غوادلوب","flag":"https://flagcdn.com/96x72/gp.png","code":"GP"},{"nameEn":"Saint Pierre and Miquelon","nameAr":"سان بيير وميكلون","flag":"https://flagcdn.com/96x72/pm.png","code":"PM"},{"nameEn":"Ecuador","nameAr":"الإكوادور","flag":"https://flagcdn.com/96x72/ec.png","code":"EC"},{"nameEn":"Greenland","nameAr":"جرينلاند","flag":"https://flagcdn.com/96x72/gl.png","code":"GL"},{"nameEn":"Grenada","nameAr":"غرينادا","flag":"https://flagcdn.com/96x72/gd.png","code":"GD"},{"nameEn":"Bahamas","nameAr":"باهاماس","flag":"https://flagcdn.com/96x72/bs.png","code":"BS"},{"nameEn":"Chile","nameAr":"تشيلي","flag":"https://flagcdn.com/96x72/cl.png","code":"CL"},{"nameEn":"Malaysia","nameAr":"ماليزيا","flag":"https://flagcdn.com/96x72/my.png","code":"MY"},{"nameEn":"Tuvalu","nameAr":"توفالو","flag":"https://flagcdn.com/96x72/tv.png","code":"TV"},{"nameEn":"Christmas Island","nameAr":"جزيرة كريسماس","flag":"https://flagcdn.com/96x72/cx.png","code":"CX"},{"nameEn":"Solomon Islands","nameAr":"جزر سليمان","flag":"https://flagcdn.com/96x72/sb.png","code":"SB"},{"nameEn":"Tanzania","nameAr":"تنزانيا","flag":"https://flagcdn.com/96x72/tz.png","code":"TZ"},{"nameEn":"North Korea","nameAr":"كوريا الشمالية","flag":"https://flagcdn.com/96x72/kp.png","code":"KP"},{"nameEn":"Guinea-Bissau","nameAr":"غينيا بيساو","flag":"https://flagcdn.com/96x72/gw.png","code":"GW"},{"nameEn":"Kosovo","nameAr":"كوسوفو","flag":"https://flagcdn.com/96x72/xk.png","code":"XK"},{"nameEn":"Vatican City","nameAr":"مدينة الفاتيكان","flag":"https://flagcdn.com/96x72/va.png","code":"VA"},{"nameEn":"Norway","nameAr":"النرويج","flag":"https://flagcdn.com/96x72/no.png","code":"NO"},{"nameEn":"Palestine","nameAr":"فلسطين","flag":"https://flagcdn.com/96x72/ps.png","code":"PS"},{"nameEn":"Cocos (Keeling) Islands","nameAr":"جزر كوكوس","flag":"https://flagcdn.com/96x72/cc.png","code":"CC"},{"nameEn":"Jamaica","nameAr":"جامايكا","flag":"https://flagcdn.com/96x72/jm.png","code":"JM"},{"nameEn":"Egypt","nameAr":"مصر","flag":"https://flagcdn.com/96x72/eg.png","code":"EG"},{"nameEn":"Cambodia","nameAr":"كمبوديا","flag":"https://flagcdn.com/96x72/kh.png","code":"KH"},{"nameEn":"Mauritius","nameAr":"موريشيوس","flag":"https://flagcdn.com/96x72/mu.png","code":"MU"},{"nameEn":"Gambia","nameAr":"غامبيا","flag":"https://flagcdn.com/96x72/gm.png","code":"GM"},{"nameEn":"Equatorial Guinea","nameAr":"غينيا الاستوائية","flag":"https://flagcdn.com/96x72/gq.png","code":"GQ"},{"nameEn":"Lesotho","nameAr":"ليسوتو","flag":"https://flagcdn.com/96x72/ls.png","code":"LS"},{"nameEn":"Martinique","nameAr":"مارتينيك","flag":"https://flagcdn.com/96x72/mq.png","code":"MQ"},{"nameEn":"United States","nameAr":"الولايات المتحدة","flag":"https://flagcdn.com/96x72/us.png","code":"US"},{"nameEn":"Western Sahara","nameAr":"الصحراء الغربية","flag":"https://flagcdn.com/96x72/eh.png","code":"EH"},{"nameEn":"United Arab Emirates","nameAr":"دولة الإمارات العربية المتحدة","flag":"https://flagcdn.com/96x72/ae.png","code":"AE"},{"nameEn":"Mozambique","nameAr":"موزمبيق","flag":"https://flagcdn.com/96x72/mz.png","code":"MZ"},{"nameEn":"Algeria","nameAr":"الجزائر","flag":"https://flagcdn.com/96x72/dz.png","code":"DZ"},{"nameEn":"Zambia","nameAr":"زامبيا","flag":"https://flagcdn.com/96x72/zm.png","code":"ZM"},{"nameEn":"Guatemala","nameAr":"غواتيمالا","flag":"https://flagcdn.com/96x72/gt.png","code":"GT"},{"nameEn":"South Korea","nameAr":"كوريا الجنوبية","flag":"https://flagcdn.com/96x72/kr.png","code":"KR"},{"nameEn":"Kyrgyzstan","nameAr":"قيرغيزستان","flag":"https://flagcdn.com/96x72/kg.png","code":"KG"},{"nameEn":"Timor-Leste","nameAr":"تيمور الشرقية","flag":"https://flagcdn.com/96x72/tl.png","code":"TL"},{"nameEn":"Åland Islands","nameAr":"جزر أولاند","flag":"https://flagcdn.com/96x72/ax.png","code":"AX"},{"nameEn":"Jordan","nameAr":"الأردن","flag":"https://flagcdn.com/96x72/jo.png","code":"JO"},{"nameEn":"Malta","nameAr":"مالطا","flag":"https://flagcdn.com/96x72/mt.png","code":"MT"},{"nameEn":"Cyprus","nameAr":"قبرص","flag":"https://flagcdn.com/96x72/cy.png","code":"CY"},{"nameEn":"Falkland Islands","nameAr":"جزر فوكلاند","flag":"https://flagcdn.com/96x72/fk.png","code":"FK"},{"nameEn":"Kazakhstan","nameAr":"كازاخستان","flag":"https://flagcdn.com/96x72/kz.png","code":"KZ"},{"nameEn":"Botswana","nameAr":"بوتسوانا","flag":"https://flagcdn.com/96x72/bw.png","code":"BW"},{"nameEn":"Saint Vincent and the Grenadines","nameAr":"سانت فينسنت والغرينادين","flag":"https://flagcdn.com/96x72/vc.png","code":"VC"},{"nameEn":"Barbados","nameAr":"باربادوس","flag":"https://flagcdn.com/96x72/bb.png","code":"BB"},{"nameEn":"Tonga","nameAr":"تونغا","flag":"https://flagcdn.com/96x72/to.png","code":"TO"},{"nameEn":"Thailand","nameAr":"تايلند","flag":"https://flagcdn.com/96x72/th.png","code":"TH"},{"nameEn":"Belgium","nameAr":"بلجيكا","flag":"https://flagcdn.com/96x72/be.png","code":"BE"},{"nameEn":"Canada","nameAr":"كندا","flag":"https://flagcdn.com/96x72/ca.png","code":"CA"},{"nameEn":"Georgia","nameAr":"جورجيا","flag":"https://flagcdn.com/96x72/ge.png","code":"GE"},{"nameEn":"Wallis and Futuna","nameAr":"واليس وفوتونا","flag":"https://flagcdn.com/96x72/wf.png","code":"WF"},{"nameEn":"Fiji","nameAr":"فيجي","flag":"https://flagcdn.com/96x72/fj.png","code":"FJ"},{"nameEn":"Netherlands","nameAr":"هولندا","flag":"https://flagcdn.com/96x72/nl.png","code":"NL"},{"nameEn":"Armenia","nameAr":"أرمينيا","flag":"https://flagcdn.com/96x72/am.png","code":"AM"},{"nameEn":"Dominican Republic","nameAr":"جمهورية الدومينيكان","flag":"https://flagcdn.com/96x72/do.png","code":"DO"},{"nameEn":"Guernsey","nameAr":"غيرنزي","flag":"https://flagcdn.com/96x72/gg.png","code":"GG"},{"nameEn":"Turkmenistan","nameAr":"تركمانستان","flag":"https://flagcdn.com/96x72/tm.png","code":"TM"},{"nameEn":"Nepal","nameAr":"نيبال","flag":"https://flagcdn.com/96x72/np.png","code":"NP"},{"nameEn":"Maldives","nameAr":"المالديف","flag":"https://flagcdn.com/96x72/mv.png","code":"MV"},{"nameEn":"Libya","nameAr":"‏ليبيا","flag":"https://flagcdn.com/96x72/ly.png","code":"LY"},{"nameEn":"Brazil","nameAr":"البرازيل","flag":"https://flagcdn.com/96x72/br.png","code":"BR"}]}');
}

List<CountryModelStruct> fromJsonToCountryList(dynamic jsonArray) {
  return jsonArray
      .map((e) => e != null && e != '' ? CountryModelStruct.fromMap(e) : null)
      .toList()
      .toList()
      .cast<CountryModelStruct>();
}

List<dynamic> convertMilestoneModelStruct(
    List<MilestoneModelStruct> milestonesList) {
  List<dynamic> jsonArray = [];

  for (MilestoneModelStruct milestone in milestonesList) {
    Map<String, dynamic> jsonMember = {
      "title": milestone.title,
      "description": milestone.description,
      "amount": milestone.amount,
      "reminderOffset": milestone.reminderModel.day,
      "startDate": milestone.startDate,
      "endDate": milestone.endDate,
      "status": milestone.mileStoneStateModel.stateId,
      "milestoneType": milestone.milestoneType,
      "progress": milestone.progress,
      "invoiceUrl": milestone.invoiceUrl,
      "invoiceStatus": milestone.invoiceStatus
    };

    jsonArray.add(jsonMember);
  }

  return jsonArray;
}

String getCountryUsing(
  ProjectModelStruct projectObject,
  String lang,
  List<CountryModelStruct> listOfCountry,
) {
  if (projectObject == null) {
    return lang == 'en' ? "Select..." : "...اختر";
  }

  if (projectObject.countryCode == null) {
    return lang == 'en' ? "Select..." : "...اختر";
  }

  if (projectObject.countryCode == '') {
    return lang == 'en' ? "Select..." : "...اختر";
  }

  if (listOfCountry != null) {
    CountryModelStruct? country =
        listOfCountry.firstWhere((c) => c.code == projectObject.countryCode);

    if (country != null) {
      return lang == 'ar' ? country.nameAr : country.nameEn;
    }
  }

  return lang == 'en'
      ? "Select..."
      : "...اختر"; // Handle the case when country is not found in the list
}

List<dynamic> convertCostModelStruct(List<CostModelStruct> costsList) {
  List<dynamic> jsonArray = [];

  for (CostModelStruct cost in costsList) {
    Map<String, dynamic> jsonMember = {
      "title": cost.title,
      "category": cost.category,
      "notes": cost.notes,
      "date": cost.date,
      "unitCost": cost.unitCost,
      "unit": cost.unit,
      "duration": cost.duration,
      "durationUnit": cost.durationUnit,
      "costType": cost.costType,
    };

    jsonArray.add(jsonMember);
  }

  return jsonArray;
}

String convertDateString(String dateString) {
  if (dateString == null || dateString.isEmpty) {
    return '----/--/--';
  }

  try {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('yyyy/MM/dd').format(dateTime);
    return formattedDate;
  } catch (e) {
    // Handle parsing error if the provided string is not a valid date
    print('Error parsing date: $e');
    return '----/--/--';
  }
}

DateTime parseDateString(String dateString) {
  if (dateString != null && dateString.isNotEmpty) {
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      // Handle parsing error if the provided string is not a valid date
      print('Error parsing date: $e');
    }
  }

  // Return current date if the input string is null or empty
  return DateTime.now();
}

List<UserModelStruct> fromJsonToUserList(dynamic jsonBudy) {
  return jsonBudy
      .map((e) => e != null && e != '' ? UserModelStruct.fromMap(e) : null)
      .toList()
      .toList()
      .cast<UserModelStruct>();
}

bool findMatchingUsers(
  UserModelStruct empsModel,
  List<UserModelStruct> listOfIds,
) {
  for (var user in listOfIds) {
    if (empsModel.id == user.id) {
      return true;
    }
  }
  return false;
}

List<MemberModelStruct> convertFomrUserToMembers(
    List<UserModelStruct> userList) {
  List<MemberModelStruct> listOfUsers = [];
  for (UserModelStruct item in userList) {
    listOfUsers.add(MemberModelStruct(
        id: item.id,
        firstName: item.firstName,
        lastName: item.lastName,
        isSelected: item.isSelected,
        name: item.firstName));
  }
  return listOfUsers;
}

List<UserModelStruct> convertFromMemberToUserList(
    List<MemberModelStruct> meberList) {
  List<UserModelStruct> listOfUsers = [];
  for (MemberModelStruct item in meberList) {
    listOfUsers.add(UserModelStruct(
        id: item.id,
        firstName: item.name,
        lastName: item.name,
        isSelected: item.isSelected,
        userName: item.firstName));
  }
  return listOfUsers;
}

List<MemberModelStruct> addMidsAndAssositsToRoleList(
  List<MemberModelStruct> listOfMids,
  List<MemberModelStruct> listOfAssosits,
) {
  List<MemberModelStruct> listOf = [];

  listOf.addAll(listOfMids);
  listOf.addAll(listOfAssosits);
  return listOf;
}

List<ClientModelStruct> fromJsonToClientList(dynamic jsonBody) {
  return jsonBody
      .map((e) => e != null && e != '' ? ClientModelStruct.fromMap(e) : null)
      .toList()
      .toList()
      .cast<ClientModelStruct>();
}

ClientModelStruct? findeMatchingClient(
  int clientId,
  List<ClientModelStruct> liesntList,
) {
  for (var client in liesntList) {
    if (client.id == clientId) {
      return client;
    }
  }
  return ClientModelStruct();
}

String fromStartEndToConcatCurrentDate(
  String startDateFromModel,
  String endDateFromModel,
) {
  String startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  String endDate =
      DateFormat('yyyy-MM-dd').format(DateTime.parse(endDateFromModel));

  DateTime start = DateTime.parse(startDate);
  DateTime end = DateTime.parse(endDate);

  Duration difference = end.difference(start);

  int weeks = difference.inDays ~/ 7;
  int days = difference.inDays % 7;

  String result = '';

  if (weeks > 0) {
    result += '$weeks ${weeks == 1 ? 'Week' : 'Weeks'}';
    if (days > 0) {
      result += ' & ';
    }
  }

  if (days > 0) {
    result += '$days ${days == 1 ? 'day' : 'days'}';
  }

  return result.isEmpty ? '0 days' : result;
}

String convertToFormattedString(DateTime dateTime) {
  String formattedString =
      DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").format(dateTime.toUtc());

  return formattedString;
}

int getCostStatusId(
  String lang,
  String selection,
) {
  if (lang == 'en') {
    if (selection == "Pending") {
      return 0;
    } else if (selection == "Approved") {
      return 1;
    } else {
      return 2;
    }
  } else {
    if (selection == "قيد الانتظار") {
      return 0;
    } else if (selection == "موافقة") {
      return 1;
    } else {
      return 2;
    }
  }
}

String? convertAnyThingToString(dynamic any) {
  return any.toString();
}

int getTypeofExpensesiD(
  String lang,
  String selection,
) {
  if (lang == 'en') {
    if (selection == 'OPEX') {
      return 1;
    } else {
      return 2;
    }
  } else {
    if (selection == 'النفقات التشغيلية') {
      return 1;
    } else {
      return 2;
    }
  }
}

String getIdByExpensesName(
  String lang,
  int selection,
) {
  if (lang == 'en') {
    if (selection == 1) {
      return 'OPEX';
    } else {
      return 'COGS';
    }
  } else {
    if (selection == 1) {
      return 'النفقات التشغيلية';
    } else {
      return 'تكلفة البضائع المباعة';
    }
  }
}

List<UserModelStruct> addIsSelectedValue(
  List<MemberModelStruct> listOfLocalUserModels,
  List<UserModelStruct> listOfBackendUseres,
) {
  for (var backendUsere in listOfBackendUseres) {
    for (var localUserModels in listOfLocalUserModels) {
      if (backendUsere.id == localUserModels.id) {
        backendUsere.isSelected = localUserModels.isSelected;
      }
    }
  }

  return listOfBackendUseres;
}

List<dynamic> convertMembertModelStruct(
    List<MemberModelStruct> memberModelList) {
  List<dynamic> jsonArray = [];

  for (MemberModelStruct member in memberModelList) {
    Map<String, dynamic> jsonMember = {
      "userId": member.id,
      "status": member.status,
    };

    jsonArray.add(jsonMember);
  }

  return jsonArray;
}

String getCostStatusName(
  String lang,
  int selection,
) {
  if (lang == 'en') {
    if (selection == 0) {
      return "Pending";
    } else if (selection == 1) {
      return "Approved";
    } else {
      return "Rejected";
    }
  } else {
    if (selection == 0) {
      return "قيد الانتظار";
    } else if (selection == 1) {
      return "موافقة";
    } else {
      return "مرفوض";
    }
  }
}

List<MemberModelStruct> addMemberItemsToList(
  String seniorName,
  String seniorId,
  String seniorPicture,
  List<MemberModelStruct> midManagers,
  List<MemberModelStruct> associates,
) {
  List<MemberModelStruct> members = [];
  members.add(MemberModelStruct(
      name: seniorName,
      id: seniorId,
      picture: seniorPicture,
      firstName: 'Senior'));

  midManagers.forEach((MemberModelStruct item) {
    members.add(MemberModelStruct(
        name: item.name,
        id: item.id,
        picture: item.picture,
        firstName: 'Mid Manager'));
  });

  associates.forEach((MemberModelStruct item) {
    members.add(MemberModelStruct(
        name: item.name,
        id: item.id,
        picture: item.picture,
        firstName: 'Associates'));
  });

  return members;
}

String getAccessRoleName(int accessRole) {
  if (accessRole == 1) {
    return "General Manager";
  } else if (accessRole == 2) {
    return "Senior";
  } else if (accessRole == 3) {
    return "Middle Manager";
  } else {
    return "Leader";
  }
}

String fromStartEndToConcat(
  String startDateFromModel,
  String endDateFromModel,
) {
  String startDate =
      DateFormat('yyyy-MM-dd').format(DateTime.parse(startDateFromModel));

  String endDate =
      DateFormat('yyyy-MM-dd').format(DateTime.parse(endDateFromModel));

  DateTime start = DateTime.parse(startDate);
  DateTime end = DateTime.parse(endDate);

  Duration difference = end.difference(start);

  int weeks = difference.inDays ~/ 7;
  int days = difference.inDays % 7;

  String result = '';

  if (weeks > 0) {
    result += '$weeks ${weeks == 1 ? 'Week' : 'Weeks'}';
    if (days > 0) {
      result += ' & ';
    }
  }

  if (days > 0) {
    result += '$days ${days == 1 ? 'day' : 'days'}';
  }

  return result.isEmpty ? '0 days' : result;
}

int calculateRemainingPercentage(
  String startDate,
  String endDate,
) {
  DateTime startDateTime = DateTime.parse(startDate);
  DateTime endDateTime = DateTime.parse(endDate);
  DateTime currentDateTime = DateTime.now();

  if (currentDateTime.isAfter(endDateTime)) {
    // If the end date is in the past, return 0% remaining
    return 0;
  }

  Duration totalDuration = endDateTime.difference(startDateTime);
  Duration remainingDuration = endDateTime.difference(currentDateTime);

  double remainingPercentage =
      (remainingDuration.inMilliseconds / totalDuration.inMilliseconds) * 100;

  return remainingPercentage.round();
}

String convertFromIdToTextClientSatisfaction(
  int clientSatisfactionId,
  String lang,
) {
  Map<int, String> satisfactionLevels = {
    1: 'HighlyDissatisfied',
    2: 'Dissatisfied',
    3: 'Neutral',
    4: 'Satisfied',
    5: 'HighlySatisfied',
  };

  // Check if the ID is valid
  if (satisfactionLevels.containsKey(clientSatisfactionId)) {
    // Check if the language is English
    if (lang == 'en') {
      return satisfactionLevels[clientSatisfactionId] ?? '';
    } else {
      // Return empty string for other languages
      return '';
    }
  } else {
    // Return empty string for invalid IDs
    return '';
  }
}

String convertDateFromStamp(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);

  // Format the date to "13 / 5 / 2023"
  String formattedDate = DateFormat('d / M / y').format(dateTime);

  return formattedDate;
}

List<DateTime> convertToDateTimeList(List<MilestoneModelStruct> milestones) {
  return milestones
      .map((milestone) => DateTime.parse(milestone.endDate))
      .toList();
}

bool searchFunction(
  String currentTitle,
  String searchText,
) {
  return currentTitle.toLowerCase().contains(searchText.toLowerCase());
}
