/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
import com.adobe.test.Assert;

// var SECTION = "Definitions\const";                  // provide a document reference (ie, ECMA section)
// var VERSION = "ActionScript 3.0";           // Version of JavaScript or ECMA
// var TITLE   = "static const not inherited in derived class";       // Provide ECMA section title or a description
var BUGNUMBER = "";


class Test {

    static const NAME:String = "name";

}

class SubTest extends Test {
}

Assert.expectEq("static const in class", undefined, SubTest.NAME);

