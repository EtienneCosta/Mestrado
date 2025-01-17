// Generated from /Users/etiennecosta/Desktop/Mestrado/PLC/GCS/Antlr4/ListasMistas/ListasMistas.g4 by ANTLR 4.8
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class ListasMistasLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, LISTA=3, PALAVRA=4, NUMERO=5, WS=6;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "LISTA", "PALAVRA", "NUMERO", "WS"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'.'", "','"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, "LISTA", "PALAVRA", "NUMERO", "WS"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	 
	      int numeros=0,size=0,soma=0,media=0,palavras=0;
	      int max = Integer.MIN_VALUE;
	      boolean start = false, stop = false;


	public ListasMistasLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "ListasMistas.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\b,\b\1\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\3\2\3\2\3\3\3\3\3\4\3\4\3\4\3\4"+
		"\3\4\3\4\3\5\3\5\7\5\34\n\5\f\5\16\5\37\13\5\3\6\6\6\"\n\6\r\6\16\6#\3"+
		"\7\6\7\'\n\7\r\7\16\7(\3\7\3\7\2\2\b\3\3\5\4\7\5\t\6\13\7\r\b\3\2\13\4"+
		"\2NNnn\4\2KKkk\4\2UUuu\4\2VVvv\4\2CCcc\4\2C\\c|\5\2\62;C\\c|\3\2\62;\5"+
		"\2\13\f\17\17\"\"\2.\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2"+
		"\13\3\2\2\2\2\r\3\2\2\2\3\17\3\2\2\2\5\21\3\2\2\2\7\23\3\2\2\2\t\31\3"+
		"\2\2\2\13!\3\2\2\2\r&\3\2\2\2\17\20\7\60\2\2\20\4\3\2\2\2\21\22\7.\2\2"+
		"\22\6\3\2\2\2\23\24\t\2\2\2\24\25\t\3\2\2\25\26\t\4\2\2\26\27\t\5\2\2"+
		"\27\30\t\6\2\2\30\b\3\2\2\2\31\35\t\7\2\2\32\34\t\b\2\2\33\32\3\2\2\2"+
		"\34\37\3\2\2\2\35\33\3\2\2\2\35\36\3\2\2\2\36\n\3\2\2\2\37\35\3\2\2\2"+
		" \"\t\t\2\2! \3\2\2\2\"#\3\2\2\2#!\3\2\2\2#$\3\2\2\2$\f\3\2\2\2%\'\t\n"+
		"\2\2&%\3\2\2\2\'(\3\2\2\2(&\3\2\2\2()\3\2\2\2)*\3\2\2\2*+\b\7\2\2+\16"+
		"\3\2\2\2\6\2\35#(\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}