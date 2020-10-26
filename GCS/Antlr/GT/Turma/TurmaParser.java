// Generated from Turma.g4 by ANTLR 4.8
 
import java.util.* ;

import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class TurmaParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, TURMA=4, PALAVRA=5, NOTA=6, SYMBOL=7, WS=8;
	public static final int
		RULE_turmas = 0, RULE_turma = 1, RULE_aluno = 2, RULE_notas = 3, RULE_nota = 4;
	private static String[] makeRuleNames() {
		return new String[] {
			"turmas", "turma", "aluno", "notas", "nota"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'('", "')'", "','"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, "TURMA", "PALAVRA", "NOTA", "SYMBOL", "WS"
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
	public String getGrammarFileName() { return "Turma.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	 
	     List <Integer> notas = new ArrayList<>();
	     Map <String,List<Integer>> alunos = new HashMap<>();

	public TurmaParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class TurmasContext extends ParserRuleContext {
		public List<TurmaContext> turma() {
			return getRuleContexts(TurmaContext.class);
		}
		public TurmaContext turma(int i) {
			return getRuleContext(TurmaContext.class,i);
		}
		public TurmasContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_turmas; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof TurmaListener ) ((TurmaListener)listener).enterTurmas(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof TurmaListener ) ((TurmaListener)listener).exitTurmas(this);
		}
	}

	public final TurmasContext turmas() throws RecognitionException {
		TurmasContext _localctx = new TurmasContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_turmas);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(11); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(10);
				turma();
				}
				}
				setState(13); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==TURMA || _la==PALAVRA );
			           int sum ;
			                            double media ;
			                            System.out.println("Número Total de Alunos: "+alunos.size());
			                            System.out.println();

			                            for(String nome:alunos.keySet()){
			                                System.out.println("Aluno: " +nome);
			                                sum=0;
			                                media =0.0;
			                                List <Integer> grades = alunos.get(nome);



			                                for(Integer grade:grades){
			                                    System.out.println("  Nota:     "+grade);
			                                    sum+=grade;

			                                }
			                                    media = sum/(double)grades.size();
			                                    System.out.println(" Média:     "+media);
			                                    System.out.println();

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

	public static class TurmaContext extends ParserRuleContext {
		public TerminalNode TURMA() { return getToken(TurmaParser.TURMA, 0); }
		public TerminalNode PALAVRA() { return getToken(TurmaParser.PALAVRA, 0); }
		public List<AlunoContext> aluno() {
			return getRuleContexts(AlunoContext.class);
		}
		public AlunoContext aluno(int i) {
			return getRuleContext(AlunoContext.class,i);
		}
		public TurmaContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_turma; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof TurmaListener ) ((TurmaListener)listener).enterTurma(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof TurmaListener ) ((TurmaListener)listener).exitTurma(this);
		}
	}

	public final TurmaContext turma() throws RecognitionException {
		TurmaContext _localctx = new TurmaContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_turma);
		try {
			int _alt;
			setState(24);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case TURMA:
				enterOuterAlt(_localctx, 1);
				{
				setState(17);
				match(TURMA);
				setState(18);
				match(PALAVRA);
				}
				break;
			case PALAVRA:
				enterOuterAlt(_localctx, 2);
				{
				setState(20); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(19);
						aluno();
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(22); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,1,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
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

	public static class AlunoContext extends ParserRuleContext {
		public Token PALAVRA;
		public TerminalNode PALAVRA() { return getToken(TurmaParser.PALAVRA, 0); }
		public NotasContext notas() {
			return getRuleContext(NotasContext.class,0);
		}
		public TerminalNode SYMBOL() { return getToken(TurmaParser.SYMBOL, 0); }
		public AlunoContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_aluno; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof TurmaListener ) ((TurmaListener)listener).enterAluno(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof TurmaListener ) ((TurmaListener)listener).exitAluno(this);
		}
	}

	public final AlunoContext aluno() throws RecognitionException {
		AlunoContext _localctx = new AlunoContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_aluno);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(26);
			((AlunoContext)_localctx).PALAVRA = match(PALAVRA);
			setState(27);
			match(T__0);
			setState(28);
			notas();
			setState(29);
			match(T__1);
			setState(30);
			match(SYMBOL);
			      
			                                          String nome = (((AlunoContext)_localctx).PALAVRA!=null?((AlunoContext)_localctx).PALAVRA.getText():null);
			                                          alunos.put(nome,notas);
			                                          notas = new ArrayList<>();
			                                          
			                                   
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

	public static class NotasContext extends ParserRuleContext {
		public NotaContext nota;
		public NotaContext nota() {
			return getRuleContext(NotaContext.class,0);
		}
		public List<NotasContext> notas() {
			return getRuleContexts(NotasContext.class);
		}
		public NotasContext notas(int i) {
			return getRuleContext(NotasContext.class,i);
		}
		public NotasContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_notas; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof TurmaListener ) ((TurmaListener)listener).enterNotas(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof TurmaListener ) ((TurmaListener)listener).exitNotas(this);
		}
	}

	public final NotasContext notas() throws RecognitionException {
		NotasContext _localctx = new NotasContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_notas);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(33);
			((NotasContext)_localctx).nota = nota();
			  notas.add(Integer.parseInt((((NotasContext)_localctx).nota!=null?_input.getText(((NotasContext)_localctx).nota.start,((NotasContext)_localctx).nota.stop):null))); 
			setState(39);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,3,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(35);
					match(T__2);
					setState(36);
					notas();
					}
					} 
				}
				setState(41);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,3,_ctx);
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

	public static class NotaContext extends ParserRuleContext {
		public Token NOTA;
		public TerminalNode NOTA() { return getToken(TurmaParser.NOTA, 0); }
		public NotaContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_nota; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof TurmaListener ) ((TurmaListener)listener).enterNota(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof TurmaListener ) ((TurmaListener)listener).exitNota(this);
		}
	}

	public final NotaContext nota() throws RecognitionException {
		NotaContext _localctx = new NotaContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_nota);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(42);
			((NotaContext)_localctx).NOTA = match(NOTA);
			 int nota =Integer.parseInt((((NotaContext)_localctx).NOTA!=null?((NotaContext)_localctx).NOTA.getText():null)); 

			            
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\n\60\4\2\t\2\4\3"+
		"\t\3\4\4\t\4\4\5\t\5\4\6\t\6\3\2\6\2\16\n\2\r\2\16\2\17\3\2\3\2\3\3\3"+
		"\3\3\3\6\3\27\n\3\r\3\16\3\30\5\3\33\n\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3"+
		"\5\3\5\3\5\3\5\7\5(\n\5\f\5\16\5+\13\5\3\6\3\6\3\6\3\6\2\2\7\2\4\6\b\n"+
		"\2\2\2.\2\r\3\2\2\2\4\32\3\2\2\2\6\34\3\2\2\2\b#\3\2\2\2\n,\3\2\2\2\f"+
		"\16\5\4\3\2\r\f\3\2\2\2\16\17\3\2\2\2\17\r\3\2\2\2\17\20\3\2\2\2\20\21"+
		"\3\2\2\2\21\22\b\2\1\2\22\3\3\2\2\2\23\24\7\6\2\2\24\33\7\7\2\2\25\27"+
		"\5\6\4\2\26\25\3\2\2\2\27\30\3\2\2\2\30\26\3\2\2\2\30\31\3\2\2\2\31\33"+
		"\3\2\2\2\32\23\3\2\2\2\32\26\3\2\2\2\33\5\3\2\2\2\34\35\7\7\2\2\35\36"+
		"\7\3\2\2\36\37\5\b\5\2\37 \7\4\2\2 !\7\t\2\2!\"\b\4\1\2\"\7\3\2\2\2#$"+
		"\5\n\6\2$)\b\5\1\2%&\7\5\2\2&(\5\b\5\2\'%\3\2\2\2(+\3\2\2\2)\'\3\2\2\2"+
		")*\3\2\2\2*\t\3\2\2\2+)\3\2\2\2,-\7\b\2\2-.\b\6\1\2.\13\3\2\2\2\6\17\30"+
		"\32)";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}