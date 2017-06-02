/* -*- Mode: java; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 4 -*-
 *
 * ***** BEGIN LICENSE BLOCK *****
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
import com.adobe.test.Assert;
import com.adobe.test.Utils;

function START(summary)
{
      // print out bugnumber

     /*if ( BUGNUMBER ) {
              writeLineToLog ("BUGNUMBER: " + BUGNUMBER );
      }*/
    XML.setSettings (null);
    testcases = new Array();

    // text field for results
    tc = 0;
    /*this.addChild ( tf );
    tf.x = 30;
    tf.y = 50;
    tf.width = 200;
    tf.height = 400;*/

    //_print(summary);
    var summaryParts = summary.split(" ");
    //_print("section: " + summaryParts[0] + "!");
    //fileName = summaryParts[0];

}

function TEST(section, expected, actual)
{
    AddTestCase(section, expected, actual);
}
 

function TEST_XML(section, expected, actual)
{
  var actual_t = typeof actual;
  var expected_t = typeof expected;

  if (actual_t != "xml") {
    // force error on type mismatch
    TEST(section, new XML(), actual);
    return;
  }

  if (expected_t == "string") {

    TEST(section, expected, actual.toXMLString());
  } else if (expected_t == "number") {

    TEST(section, String(expected), actual.toXMLString());
  } else {
    reportFailure ("", 'Bad TEST_XML usage: type of expected is "+expected_t+", should be number or string');
  }
}

function reportFailure (section, msg)
{
  trace("~FAILURE: " + section + " | " + msg);
}

function AddTestCase( description, expect, actual ) {
   testcases[tc++] = Assert.expectEq(description, "|"+expect+"|", "|"+actual+"|" );
}

function myGetNamespace (obj, ns) {
    if (ns != undefined) {
        return obj.namespace(ns);
    } else {
        return obj.namespace();
    }
}




function NL()
{
  //return java.lang.System.getProperty("line.separator");
  return "\n";
}


function BUG(arg){
  // nothing here
}

function END()
{
    //test();
}
 

START("13.4 XML Object - XML prefix not bound error");

var xml;
expectedStr = "TypeError: Error #1083: The prefix \"ns\" for element \"ns:x\" is not bound.";
expected = "Error #1083";
result = "error, exception not thrown";

try{

xml = new XML("<ns:x><a>1</a><a>2</a><a>3</a></ns:x>");
throw new Error("kXMLPrefixNotBound error not thrown");

} catch( e1 ){

result = Utils.grabError(e1, e1.toString());

}

Assert.expectEq( "x = new XML(var xml = new XML(\"<ns:x><a>1</a><a>2</a><a>3</a></ns:x>\")", expected, result );



expectedStr = "TypeError: Error #1083: The prefix \"ns\" for element \"ns:x\" is not bound.";
expected = "Error #1083";
result = "error, exception not thrown";

try{

xml = new XML("<ns:x xmlns:as=\"http://foo.bar\"><a>1</a><a>2</a><a>3</a></ns:x>");
throw new Error("kXMLPrefixNotBound error not thrown");

} catch( e2 ){

result = Utils.grabError(e2, e2.toString());

}

Assert.expectEq( "x = new XML(var xml = new XML(\"<ns:x xmlns:as=\"http://foo.bar\"><a>1</a><a>2</a><a>3</a></ns:x>\")", expected, result );



expectedStr = "TypeError: Error #1083: The prefix \"as\" for element \"as:a\" is not bound.";
expected = "Error #1083";
result = "error, exception not thrown";

try{

xml = new XML("<ns:b xmlns:ns=\"http://foo.bar\"><as:a>1</as:a></ns:b>");
throw new Error("kXMLPrefixNotBound error not thrown");

} catch( e3 ){

result = Utils.grabError(e3, e3.toString());

}

Assert.expectEq( "x = new XML(var xml = new XML(\"<ns:b xmlns:ns=\"http://foo.bar\"><as:a>1</as:a></ns:b>\")", expected, result );


END();

