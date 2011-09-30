/**
 * Storage plugin
 * Provides a simple interface for storing data such as user preferences.
 * Storage is useful for saving and retreiving data from the user's browser.
 * For newer browsers, localStorage is used.
 * If localStorage isn't supported, then cookies are used instead.
 * Retrievable data is limited to the same domain as this file.
 *
 * Usage:
 * This plugin extends jQuery by adding itself as a static method.
 * $.Storage - is the class name, which represents the user's data store, whether it's cookies or local storage.
 *             <code>if ($.Storage)</code> will tell you if the plugin is loaded.
 * $.Storage.set("name", "value") - Stores a named value in the data store.
 * $.Storage.set({"name1":"value1", "name2":"value2", etc}) - Stores multiple name/value pairs in the data store.
 * $.Storage.get("name") - Retrieves the value of the given name from the data store.
 * $.Storage.remove("name") - Permanently deletes the name/value pair from the data store.
 *
 * @author Dave Schindler
 *
 * Distributed under the MIT License
 *
 * Copyright (c) 2010 Dave Schindler
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
(function(a){function c(a,b){var c;if(typeof a=="string"&&typeof b=="string")return localStorage[a]=b,!0;if(typeof a=="object"&&typeof b=="undefined"){for(c in a)a.hasOwnProperty(c)&&(localStorage[c]=a[c]);return!0}return!1}function d(a,b){var c,d,e;c=new Date,c.setTime(c.getTime()+31536e6),d="; expires="+c.toGMTString();if(typeof a=="string"&&typeof b=="string")return document.cookie=a+"="+b+d+"; path=/",!0;if(typeof a=="object"&&typeof b=="undefined"){for(e in a)a.hasOwnProperty(e)&&(document.cookie=e+"="+a[e]+d+"; path=/");return!0}return!1}function e(a){return localStorage[a]}function f(a){var b,c,d,e;b=a+"=",c=document.cookie.split(";");for(d=0;d<c.length;d++){e=c[d];while(e.charAt(0)===" ")e=e.substring(1,e.length);if(e.indexOf(b)===0)return e.substring(b.length,e.length)}return null}function g(a){return delete localStorage[a]}function h(a){return d(a,"",-1)}var b=typeof window.localStorage!="undefined";a.extend({Storage:{set:b?c:d,get:b?e:f,remove:b?g:h}})})(jQuery)