// Generated from ListasMistas.g4 by ANTLR 4.8
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class ListasMistasParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, LISTA=3, PALAVRA=4, NUMERO=5, WS=6;
	public static final int
		RULE_listas = 0, RULE_lista = 1, RULE_exps = 2, RULE_exp = 3;
	private static String[] makeRuleNames() {
		return new String[] {
			"listas", "lista", "exps", "exp"
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

	@Override
	public String getGrammarFileName() { return "ListasMistas.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	 
	      int numeros=0,size=0,soma=0,media=0,palavras=0;
	      int max = Integer.MIN_VALUE;
	      boolean start = false, stop = false;

	public ListasMistasParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class ListasContext extends ParserRuleContext {
		public List<ListaContext> lista() {
			return getRuleContexts(ListaContext.class);
		}
		public ListaContext lista(int i) {
			return getRuleContext(ListaContext.class,i);
		}
		public ListasContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_listas; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof ListasMistasListener ) ((ListasMistasListener)listener).enterListas(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof ListasMistasListener ) ((ListasMistasListener)listener).exitListas(this);
		}
	}

	public final ListasContext listas() throws RecognitionException {
		ListasContext _localctx = new ListasContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_listas);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(9); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(8);
				lista();
				}
				}
				setState(11); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==LISTA );
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ListaContext extends ParserRuleContext {
		public TerminalNode LISTA() { return getToken(ListasMistasParser.LISTA, 0); }
		public ExpsContext exps() {
			return getRuleContext(ExpsContext.class,0);
		}
		public ListaContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_lista; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof ListasMistasListener ) ((ListasMistasListener)listener).enterLista(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof ListasMistasListener ) ((ListasMistasListener)listener).exitLista(this);
		}
	}

	public final ListaContext lista() throws RecognitionException {
		ListaContext _localctx = new ListaContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_lista);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(13);
			match(LISTA);
			setState(14);
			exps();
			setState(15);
			match(T__0);
			 

			                  
			                  System.out.println("--------------------------------------------------------");
			                  System.out.println("Comprimento da lista: "+size);
			                  System.out.println("Quantidade de números: "+numeros);

			                  if(numeros!=0) {
			                        if(stop!=true)
			                              soma=0;
			                  System.out.println("Máximo dos números: "+max);
			                  System.out.println("Somatório dos números: "+soma);
			                  System.out.println("Média: "+media/(double)numeros);
			                              
			                              }

			                  if(numeros==palavras)
			                        System.out.println("Quantidade de palavras ("+palavras+") == Quantidade de números ("+numeros+")");

			                  else 
			                        System.out.println("Quantidade de palavras ("+palavras+") =/= Quantidade de números ("+numeros+")");


			                  System.out.println();
			                  numeros=0;  media=0; size=0; soma = 0 ;  palavras = 0;
			                  max= Integer.MIN_VALUE;
			                  start = false; stop = false;
			                 

			                
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpsContext extends ParserRuleContext {
		public List<ExpContext> exp() {
			return getRuleContexts(ExpContext.class);
		}
		public ExpContext exp(int i) {
			return getRuleContext(ExpContext.class,i);
		}
		public ExpsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_exps; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof ListasMistasListener ) ((ListasMistasListener)listener).enterExps(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof ListasMistasListener ) ((ListasMistasListener)listener).exitExps(this);
		}
	}

	public final ExpsContext exps() throws RecognitionException {
		ExpsContext _localctx = new ExpsContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_exps);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(18);
			exp();
			size++;
			setState(26);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__1) {
				{
				{
				setState(20);
				match(T__1);
				setState(21);
				exp();
				size++;
				}
				}
				setState(28);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpContext extends ParserRuleContext {
		public Token PALAVRA;
		public Token NUMERO;
		public TerminalNode PALAVRA() { return getToken(ListasMistasParser.PALAVRA, 0); }
		public TerminalNode NUMERO() { return getToken(ListasMistasParser.NUMERO, 0); }
		public ExpContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_exp; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof ListasMistasListener ) ((ListasMistasListener)listener).enterExp(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof ListasMistasListener ) ((ListasMistasListener)listener).exitExp(this);
		}
	}

	public final ExpContext exp() throws RecognitionException {
		ExpContext _localctx = new ExpContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_exp);
		try {
			setState(33);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case PALAVRA:
				enterOuterAlt(_localctx, 1);
				{
				setState(29);
				((ExpContext)_localctx).PALAVRA = match(PALAVRA);
				 if((((ExpContext)_localctx).PALAVRA!=null?((ExpContext)_localctx).PALAVRA.getText():null).equals("start")) 
				                        start = true;

				                   if((((ExpContext)_localctx).PALAVRA!=null?((ExpContext)_localctx).PALAVRA.getText():null).equals("stop")&& start==true) {
				                        stop = true;
				                        start=false;
				                   }

				                  palavras++;
				                
				}
				break;
			case NUMERO:
				enterOuterAlt(_localctx, 2);
				{
				setState(31);
				((ExpContext)_localctx).NUMERO = match(NUMERO);
				    numeros++; 
				                   media+=(((ExpContext)_localctx).NUMERO!=null?Integer.valueOf(((ExpContext)_localctx).NUMERO.getText()):0);
				 
				                  if(start==true)
				                        soma+=(((ExpContext)_localctx).NUMERO!=null?Integer.valueOf(((ExpContext)_localctx).NUMERO.getText()):0);
				            

				                  if((((ExpContext)_localctx).NUMERO!=null?Integer.valueOf(((ExpContext)_localctx).NUMERO.getText()):0) > max)
				                        max=(((ExpContext)_localctx).NUMERO!=null?Integer.valueOf(((ExpContext)_localctx).NUMERO.getText()):0);

				              
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\b&\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\4\5\t\5\3\2\6\2\f\n\2\r\2\16\2\r\3\3\3\3\3\3\3\3\3\3\3\4\3"+
		"\4\3\4\3\4\3\4\3\4\7\4\33\n\4\f\4\16\4\36\13\4\3\5\3\5\3\5\3\5\5\5$\n"+
		"\5\3\5\2\2\6\2\4\6\b\2\2\2$\2\13\3\2\2\2\4\17\3\2\2\2\6\24\3\2\2\2\b#"+
		"\3\2\2\2\n\f\5\4\3\2\13\n\3\2\2\2\f\r\3\2\2\2\r\13\3\2\2\2\r\16\3\2\2"+
		"\2\16\3\3\2\2\2\17\20\7\5\2\2\20\21\5\6\4\2\21\22\7\3\2\2\22\23\b\3\1"+
		"\2\23\5\3\2\2\2\24\25\5\b\5\2\25\34\b\4\1\2\26\27\7\4\2\2\27\30\5\b\5"+
		"\2\30\31\b\4\1\2\31\33\3\2\2\2\32\26\3\2\2\2\33\36\3\2\2\2\34\32\3\2\2"+
		"\2\34\35\3\2\2\2\35\7\3\2\2\2\36\34\3\2\2\2\37 \7\6\2\2 $\b\5\1\2!\"\7"+
		"\7\2\2\"$\b\5\1\2#\37\3\2\2\2#!\3\2\2\2$\t\3\2\2\2\5\r\34#";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}