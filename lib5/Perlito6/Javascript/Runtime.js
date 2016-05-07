// lib/Perlito6/JavaScript/Runtime.js
//
// Runtime for "Perlito6" Perl6-in-JavaScript
//
// AUTHORS
//
// Flavio Soibelmann Glock  fglock@gmail.com
// The Pugs Team  perl6-compiler@perl.org
//
// SEE ALSO
//
// The Perl 6 homepage at http://dev.perl.org/perl6
// The Pugs homepage at http://pugscode.org/
//
// COPYRIGHT
//
// Copyright 2009, 2010, 2011, 2012 by Flavio Soibelmann Glock and others.
// 
// This program is free software; you can redistribute it and/or modify it
// under the same terms as Perl itself.
// 
// See http://www.perl.com/perl/misc/Artistic.html

if (typeof arguments === 'object') {
    List_ARGS = arguments;
}

// class IO
if (typeof IO !== 'object') {
    IO = function() {};
    IO = new IO;
}

IO.slurp = function(filename) {
    if (typeof readFile == 'function') {
        return readFile(filename);
    }
    if (typeof read == 'function') {
        // v8
        return read(filename);
    }
    die("IO.slurp() not implemented");
};

// class Main
if (typeof Main !== 'object') {
    Main = function() {};
    Main = new Main;
}

(function() {
    Main._dump = function(o) {
        var out = [];
        for (var i in o) {
            if (i.match(/^v_/)) {
                out.push(i.substr(2) + " => " + perl(o[i]));
            }
            // else if (i.match(/^/)) {
            // } else {
            //    out.push(i + " => " + perl(o[i]));
            // }
        }
        return out.join(", ");
    };
})();

if (typeof Perlito6$Match !== 'object') {
    Perlito6$Match = function() {};
    Perlito6$Match = new Perlito6$Match;
    Perlito6$Match.isa = function(s) {
        return s == 'Perlito6::Match';
    };
    Perlito6$Match.perl = function() {
        return 'Perlito6::Match.new(' + Main._dump(this) + ')';
    };
}

v_MATCH = {};
v_MATCH.__proto__ = Perlito6$Match;

Perlito6$Match.hash = function() {
    return this;
};

if (typeof f_print !== 'function') {
    var buf = "";
    f_print = function() {
        var i;
        for (i = 0; i < f_print.arguments.length; i++) {
            var s = string(f_print.arguments[i]);
            if (s.substr(s.length - 2, 2) == "\n") {
                print(buf + s.substr(0, s.length - 2));
                buf = "";
            }
            else if (s.substr(s.length - 1, 1) == "\n") {
                print(buf + s.substr(0, s.length - 1));
                buf = "";
            }
            else {
                buf = buf + s;
            }
        }
        return true;
    };
}

if (typeof say !== 'function') {
    say = function() {
        var i;
        for (i = 0; i < say.arguments.length; i++) {
            f_print(say.arguments[i]);
        }
        return f_print("\n");
    };
}

if (typeof die !== 'function') {
    die = function() {
        var i;
        var s = '';
        for (i = 0; i < die.arguments.length; i++) {
            s = s + die.arguments[i];
        }
        f_print("Died: " + s + "\n");
    };
}

if (typeof warn !== 'function') {
    warn = function() {
        var i;
        var s = '';
        for (i = 0; i < warn.arguments.length; i++) {
            s = s + warn.arguments[i];
        }
        f_print("Warning: " + s + "\n");
    };
}

chr = function(o) {
    return String.fromCharCode(num(o));
};

elems = function(o) {
    if (o == null) {
        return 1;
    };
    if (typeof o.elems === 'function') {
        return o.elems();
    }
    if (typeof o === 'object' && (o instanceof Array)) {
        return o.length;
    }
    switch (typeof o) {
        case "string": return 1;
        case "function": return 1;
        case "number": return 1;
        case "boolean": return 1;
    }
    var l = 0;
    for (var i in o) {
        l++;
    }
    return l;
};

values = function(o) {
    if (o == null) {
        return [];
    };
    if (typeof o.values === 'function') {
        return o.values();
    }
    if (typeof o === 'object' && (o instanceof Array)) {
        return o;
    }
    switch (typeof o) {
        case "string": return [o];
        case "function": return [o];
        case "number": return [o];
        case "boolean": return [o];
    }
    var out = [];
    for (var i in o) {
        out.push(o[i]);
    }
    return out;
};

keys = function(o) {
    if (o == null) {
        return [];
    }
    if (typeof o.keys === 'function') {
        return o.keys();
    }
    var out = [];
    if (typeof o === 'object' && (o instanceof Array)) {
        var count = 0;
        for (var i in o) {
            out.push(count);
            count++;
        }
        return out;
    }
    for (var i in o) {
        out.push(i);
    }
    return out;
};

pairs = function(o) {
    if (o == null) {
        return [];
    }
    if (typeof o.pairs === 'function') {
        return o.pairs();
    }
    if (typeof o === 'object' && (o instanceof Array)) {
        var count = 0;
        for (var i in o) {
            var tmp = {
                v_key: count,
                v_value: i
            };
            tmp.__proto__ = Pair;
            out.push(tmp);
            count++;
        }
        return o;
    }
    var out = [];
    for (var i in o) {
        var tmp = {
            v_key: i,
            v_value: o[i]
        };
        tmp.__proto__ = Pair;
        out.push(tmp);
    }
    return out;
};

Array.prototype.grep = function grep(f) {
    var res = new Array()
    for (var i in this) {
        if (bool(f(this[i]))) {
            res.push(this[i])
        }
    }
    return res
}

var _id = 0;
id = function(o) {
    if (o == null) {
        return '_id_' + 'Mu';
    }
    if (typeof o.id === 'function') {
        return o.id();
    }
    if (o._id) {
        return o._id;
    }
    switch (typeof o) {
        case "string": return '_id_str_' + o;
        case "number": return '_id_num_' + o;
        case "boolean": return '_id_bool_' + o;
    }
    o._id = ++_id;
    return o._id;
};

perl = function(o) {
    if (o == null) {
        return 'Mu';
    }
    if (typeof o.perl === 'function') {
        return o.perl();
    }
    if (typeof o === 'object' && (o instanceof Array)) {
        var out = [];
        for (var i = 0; i < o.length; i++) {
            out.push(perl(o[i]));
        }
        return "[" + out.join(", ") + "]";
    }
    switch (typeof o) {
        case "string": return '"' + Main.lisp_escape_string(o) + '"';
        case "function": return "function";
        case "number": return o;
        case "boolean": return o;
    }
    var out = [];
    for (var i in o) {
        out.push(i + " => " + perl(o[i]));
    }
    return '{' + out.join(", ") + '}';
};

isa = function(o, s) {
    if (o == null) {
        if (s == 'Mu') {
            return true;
        } else {
            return false;
        }
    }
    if (typeof o.isa === 'function') {
        return o.isa(s);
    }
    switch (typeof o) {
        case "string": return (s == 'Str');
        case "number": return (s == 'Num');
    }
    if (s == 'Array' && typeof o === 'object' && (o instanceof Array)) {
        return (1);
    }
    return false;
};

scalar = function(o) {
    if (o == null) {
        return o;
    }
    if (typeof o.scalar === 'function') {
        return o.scalar();
    }
    return o;
};

string = function(o) {
    if (o == null) {
        return "";
    }
    if (typeof o === 'object' && (o instanceof Array)) {
        var out = [];
        for (var i = 0; i < o.length; i++) {
            out.push(string(o[i]));
        }
        return out.join(" ");
    }
    if (typeof o.string === 'function') {
        return o.string();
    }
    if (typeof o !== 'string') {
        return "" + o;
    }
    return o;
};

num = function(o) {
    if (o == null) {
        return 0;
    }
    if (typeof o === 'object' && (o instanceof Array)) {
        return o.length;
    }
    if (typeof o.num === 'function') {
        return o.num();
    }
    if (typeof o !== 'number') {
        return parseFloat(string(o));
    }
    return o;
};

add = function(o1, o2) {
    return num(o1) + num(o2)
};

bool = function(o) {
    if (o == null) {
        return o;
    }
    if (typeof o === 'boolean') {
        return o;
    }
    if (typeof o === 'number') {
        return o;
    }
    if (typeof o === 'string') {
        return o != '' && o != '0';
    }
    if (typeof o.bool === 'function') {
        return o.v_bool;
    }
    if (typeof o.length === 'number') {
        return o.length;
    }
    for (var i in o) {
        return true;
    }
    return false;
};

and = function(a, fb) {
    if (bool(a)) {
        return fb();
    }
    return false;
};

or = function(a, fb) {
    if (bool(a)) {
        return a;
    }
    return fb();
};

defined_or = function(a, fb) {
    if (a == null) {
        return fb();
    }
    return a;
};

pop = function(o) {
    if (o.length == null) {
        return null;
    }
    return o.pop();
};

shift = function(o) {
    if (o.length == null) {
        return null;
    }
    return o.shift();
};

push = function(o, v) {
    return o.push(v);
};

unshift = function(o, v) {
    return o.unshift(v);
};

index = function(o, s) {
    return o.indexOf(s);
};

chars = function(o) {
    if (typeof o.string === 'function') {
        return o.string().length;
    }
    return o.length;
};

str_replicate = function(o, num) {
    return num ? Array(num + 1).join(o) : "";
};

// regex primitives
if (typeof Perlito6$Grammar !== 'object') {
    Perlito6$Grammar = function() {};
    Perlito6$Grammar = new Perlito6$Grammar;
}

Perlito6$Grammar.word = function(v_str, v_pos) {
    var tmp = {
        v_str: v_str,
        v_from: v_pos,
        v_to: v_pos + 1,
        v_bool: v_str.substr(v_pos, 1).match(/\w/) != null
    };
    tmp.__proto__ = Perlito6$Match;
    return tmp;
};

Perlito6$Grammar.digit = function(v_str, v_pos) {
    var tmp = {
        v_str: v_str,
        v_from: v_pos,
        v_to: v_pos + 1,
        v_bool: v_str.substr(v_pos, 1).match(/\d/) != null
    };
    tmp.__proto__ = Perlito6$Match;
    return tmp;
};

Perlito6$Grammar.space = function(v_str, v_pos) {
    var tmp = {
        v_str: v_str,
        v_from: v_pos,
        v_to: v_pos + 1,
        v_bool: v_str.substr(v_pos, 1).match(/\s/) != null
    };
    tmp.__proto__ = Perlito6$Match;
    return tmp;
};

