// Generated from /Users/etiennecosta/Desktop/Mestrado/PLC/GCS/Antlr4/Faturas/Faturas.g4 by ANTLR 4.8
 
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
public class FaturasParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		PALAVRA=1, NUMERO=2, WS=3;
	public static final int
		RULE_faturas = 0, RULE_fatura = 1, RULE_header = 2, RULE_fornecedor = 3, 
		RULE_cliente = 4, RULE_body = 5, RULE_produtos = 6, RULE_produto = 7, 
		RULE_numero = 8, RULE_nif = 9, RULE_nib = 10, RULE_nome = 11, RULE_morada = 12, 
		RULE_ref = 13, RULE_quantidade = 14, RULE_desc = 15, RULE_preco = 16;
	private static String[] makeRuleNames() {
		return new String[] {
			"faturas", "fatura", "header", "fornecedor", "cliente", "body", "produtos", 
			"produto", "numero", "nif", "nib", "nome", "morada", "ref", "quantidade", 
			"desc", "preco"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "PALAVRA", "NUMERO", "WS"
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
	public String getGrammarFileName() { return "Faturas.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }




	    public double sum(List<Double> array){
	      double res=0;
	      for(Double preco: array)
	            res+=preco;
	            return res;
	      }

	    public class Produto {

	    private Integer ref;
	    private String desc;
	    private Double preco;
	    private Integer quantidade;




	    public Produto(Integer ref, String desc, Double preco, Integer quantidade) {
	        this.ref = ref;
	        this.desc = desc;
	        this.preco = preco;
	        this.quantidade = quantidade;
	    }

	    public Integer getRef() {
	        return ref;
	    }

	    public String getDesc() {
	        return desc;
	    }

	    public Double getPreco() {
	        return preco;
	    }

	    public Integer getQuantidade() {
	        return quantidade;
	    }


	    public void setRef(Integer ref) {
	        this.ref = ref;
	    }

	    public void setDesc(String desc) {
	        this.desc = desc;
	    }

	    public void setPreco(Double preco) {
	        this.preco = preco;
	    }

	    public void setQuantidade(Integer quantidade) {
	        this.quantidade = quantidade;
	    }


	    @Override
	    public String toString() {
	        return "Produto{" +
	                "ref=" + ref +
	                ", desc='" + desc + '\'' +
	                ", preco=" + preco +"€"+
	                ", quantidade=" + quantidade +
	                '}';
	    }
	}


	public FaturasParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class FaturasContext extends ParserRuleContext {
		public Map <Integer,Produto> productsOut = new HashMap<>();
		public ProdutosContext produtos() {
			return getRuleContext(ProdutosContext.class,0);
		}
		public List<FaturaContext> fatura() {
			return getRuleContexts(FaturaContext.class);
		}
		public FaturaContext fatura(int i) {
			return getRuleContext(FaturaContext.class,i);
		}
		public FaturasContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_faturas; }
	}

	public final FaturasContext faturas() throws RecognitionException {
		FaturasContext _localctx = new FaturasContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_faturas);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(34);
			produtos(_localctx.productsOut);

			    
			                                                                            System.out.println ();
			                                                                            System.out.println("----------- LISTA DE PRODUTOS EM STOCK --------------");
			                                                                            System.out.println ();
			                                                                                for (Produto p :_localctx.productsOut.values()){
			                                                                            System.out.println("--------------------------------------------------------");
			                                                                                    System.out.println(p.toString());
			                                                                            System.out.println("--------------------------------------------------------");
			                                                                                }

			                                                                                                
			setState(37); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(36);
				fatura(_localctx.productsOut);
				}
				}
				setState(39); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==NUMERO );
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

	public static class FaturaContext extends ParserRuleContext {
		public Map<Integer,Produto> productsIn;
		public List <Double> totalOut = new ArrayList<>();
		public HeaderContext header;
		public HeaderContext header() {
			return getRuleContext(HeaderContext.class,0);
		}
		public List<BodyContext> body() {
			return getRuleContexts(BodyContext.class);
		}
		public BodyContext body(int i) {
			return getRuleContext(BodyContext.class,i);
		}
		public FaturaContext(ParserRuleContext parent, int invokingState) { super(parent, invokingState); }
		public FaturaContext(ParserRuleContext parent, int invokingState, Map<Integer,Produto> productsIn) {
			super(parent, invokingState);
			this.productsIn = productsIn;
		}
		@Override public int getRuleIndex() { return RULE_fatura; }
	}

	public final FaturaContext fatura(Map<Integer,Produto> productsIn) throws RecognitionException {
		FaturaContext _localctx = new FaturaContext(_ctx, getState(), productsIn);
		enterRule(_localctx, 2, RULE_fatura);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(41);
			((FaturaContext)_localctx).header = header();

			                                                  System.out.println ();
			                                                  System.out.println("-------------------- FATURA "+ ((FaturaContext)_localctx).header.idFaturaOut+" -----------------------");
			                                                  
			setState(44); 
			_errHandler.sync(this);
			_alt = 1;
			do {
				switch (_alt) {
				case 1:
					{
					{
					setState(43);
					body(_localctx.productsIn,_localctx.totalOut);
					}
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(46); 
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,1,_ctx);
			} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );

			                                                                System.out.println("TOTAL GASTO NA FATURA "+((FaturaContext)_localctx).header.idFaturaOut+": "+sum(_localctx.totalOut)+" €");
			                                                                System.out.println("-----------------------------------------------------");


			System.out.println ();
			                                                                            System.out.println("------ ACTUALIZAÇÃO DOS PRODUTOS EM STOCK -----------");
			                                                                            System.out.println ();
			                                                                                for (Produto p :_localctx.productsIn.values()){
			                                                                            System.out.println("--------------------------------------------------------");
			                                                                                    System.out.println(p.toString());
			                                                                            System.out.println("--------------------------------------------------------");

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

	public static class HeaderContext extends ParserRuleContext {
		public int idFaturaOut;
		public NumeroContext numero;
		public NumeroContext numero() {
			return getRuleContext(NumeroContext.class,0);
		}
		public FornecedorContext fornecedor() {
			return getRuleContext(FornecedorContext.class,0);
		}
		public ClienteContext cliente() {
			return getRuleContext(ClienteContext.class,0);
		}
		public HeaderContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_header; }
	}

	public final HeaderContext header() throws RecognitionException {
		HeaderContext _localctx = new HeaderContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_header);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(50);
			((HeaderContext)_localctx).numero = numero();
			setState(51);
			fornecedor();
			setState(52);
			cliente();
			 ((HeaderContext)_localctx).idFaturaOut =  ((HeaderContext)_localctx).numero.numeroOut;
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

	public static class FornecedorContext extends ParserRuleContext {
		public NomeContext nome() {
			return getRuleContext(NomeContext.class,0);
		}
		public NifContext nif() {
			return getRuleContext(NifContext.class,0);
		}
		public MoradaContext morada() {
			return getRuleContext(MoradaContext.class,0);
		}
		public NibContext nib() {
			return getRuleContext(NibContext.class,0);
		}
		public FornecedorContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_fornecedor; }
	}

	public final FornecedorContext fornecedor() throws RecognitionException {
		FornecedorContext _localctx = new FornecedorContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_fornecedor);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(55);
			nome();
			setState(56);
			nif();
			setState(57);
			morada();
			setState(58);
			nib();
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

	public static class ClienteContext extends ParserRuleContext {
		public NomeContext nome() {
			return getRuleContext(NomeContext.class,0);
		}
		public NifContext nif() {
			return getRuleContext(NifContext.class,0);
		}
		public MoradaContext morada() {
			return getRuleContext(MoradaContext.class,0);
		}
		public ClienteContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_cliente; }
	}

	public final ClienteContext cliente() throws RecognitionException {
		ClienteContext _localctx = new ClienteContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_cliente);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(60);
			nome();
			setState(61);
			nif();
			setState(62);
			morada();
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

	public static class BodyContext extends ParserRuleContext {
		public Map <Integer,Produto> productsIn;
		public List <Double> totalIn;
		public RefContext ref;
		public QuantidadeContext quantidade;
		public RefContext ref() {
			return getRuleContext(RefContext.class,0);
		}
		public QuantidadeContext quantidade() {
			return getRuleContext(QuantidadeContext.class,0);
		}
		public BodyContext(ParserRuleContext parent, int invokingState) { super(parent, invokingState); }
		public BodyContext(ParserRuleContext parent, int invokingState, Map <Integer,Produto> productsIn, List <Double> totalIn) {
			super(parent, invokingState);
			this.productsIn = productsIn;
			this.totalIn = totalIn;
		}
		@Override public int getRuleIndex() { return RULE_body; }
	}

	public final BodyContext body(Map <Integer,Produto> productsIn,List <Double> totalIn) throws RecognitionException {
		BodyContext _localctx = new BodyContext(_ctx, getState(), productsIn, totalIn);
		enterRule(_localctx, 10, RULE_body);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(64);
			((BodyContext)_localctx).ref = ref();
			setState(65);
			((BodyContext)_localctx).quantidade = quantidade();
			  int refProd = ((BodyContext)_localctx).ref.refOut;
			                                                                                  int quantidadeC = ((BodyContext)_localctx).quantidade.quantidadeOut;


			                                                            if(_localctx.productsIn.containsKey(refProd)){

			                                                                Produto p = _localctx.productsIn.get(refProd);


			                                                                if(p.getQuantidade() - quantidadeC >=0){


			                                                                    _localctx.totalIn.add(p.getPreco()*quantidadeC);


			                                                                  
			                                                                    System.out.println("-----------------------------------------------------");
			                                                                    System.out.println("Descrição: "+p.getDesc() + "    Preço: "+p.getPreco()+" €");
			                                                                    System.out.println("Referência do Produto: "+refProd + "    Quantidade: "+quantidadeC);
			                                                                    System.out.println("Total Gasto : "+ p.getPreco()*quantidadeC);                                                                    
			                                                                    System.out.println("-----------------------------------------------------");

			                                                                    p.setQuantidade(p.getQuantidade() - quantidadeC);
			                                                                    _localctx.productsIn.replace(refProd,p);







			                                                                }

			                                                                else {
			                                                                        System.out.println("-----------------------------------------------------");                                    
			                                                                        System.out.println("Impossível fazer esta aquisição:     ");
			                                                                        System.out.println();
			                                                                        System.out.println("Descrição: "+p.getDesc() + "    Preço: "+p.getPreco()+" €");
			                                                                        System.out.println("Referência do Produto: "+refProd + "    Quantidade: "+quantidadeC);
			                                                                        System.out.println("Quantidade em Stock : "+p.getQuantidade()+ "      Quantidade desejada: "+quantidadeC  );
			                                                                        System.out.println("-----------------------------------------------------");

			                                                                }




			                                                            }

			                                                            else {
			                                                                System.out.println("-----------------------------------------------------");
			                                                                System.out.println("Produto Inexistente: "+refProd);
			                                                                System.out.println("-----------------------------------------------------");

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

	public static class ProdutosContext extends ParserRuleContext {
		public Map<Integer,Produto> productsIn;
		public List<ProdutoContext> produto() {
			return getRuleContexts(ProdutoContext.class);
		}
		public ProdutoContext produto(int i) {
			return getRuleContext(ProdutoContext.class,i);
		}
		public ProdutosContext(ParserRuleContext parent, int invokingState) { super(parent, invokingState); }
		public ProdutosContext(ParserRuleContext parent, int invokingState, Map<Integer,Produto> productsIn) {
			super(parent, invokingState);
			this.productsIn = productsIn;
		}
		@Override public int getRuleIndex() { return RULE_produtos; }
	}

	public final ProdutosContext produtos(Map<Integer,Produto> productsIn) throws RecognitionException {
		ProdutosContext _localctx = new ProdutosContext(_ctx, getState(), productsIn);
		enterRule(_localctx, 12, RULE_produtos);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(69); 
			_errHandler.sync(this);
			_alt = 1;
			do {
				switch (_alt) {
				case 1:
					{
					{
					setState(68);
					produto(_localctx.productsIn);
					}
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(71); 
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,2,_ctx);
			} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
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

	public static class ProdutoContext extends ParserRuleContext {
		public Map <Integer,Produto> productsIn;
		public RefContext ref;
		public DescContext desc;
		public PrecoContext preco;
		public QuantidadeContext quantidade;
		public RefContext ref() {
			return getRuleContext(RefContext.class,0);
		}
		public DescContext desc() {
			return getRuleContext(DescContext.class,0);
		}
		public PrecoContext preco() {
			return getRuleContext(PrecoContext.class,0);
		}
		public QuantidadeContext quantidade() {
			return getRuleContext(QuantidadeContext.class,0);
		}
		public ProdutoContext(ParserRuleContext parent, int invokingState) { super(parent, invokingState); }
		public ProdutoContext(ParserRuleContext parent, int invokingState, Map <Integer,Produto> productsIn) {
			super(parent, invokingState);
			this.productsIn = productsIn;
		}
		@Override public int getRuleIndex() { return RULE_produto; }
	}

	public final ProdutoContext produto(Map <Integer,Produto> productsIn) throws RecognitionException {
		ProdutoContext _localctx = new ProdutoContext(_ctx, getState(), productsIn);
		enterRule(_localctx, 14, RULE_produto);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(73);
			((ProdutoContext)_localctx).ref = ref();
			setState(74);
			((ProdutoContext)_localctx).desc = desc();
			setState(75);
			((ProdutoContext)_localctx).preco = preco();
			setState(76);
			((ProdutoContext)_localctx).quantidade = quantidade();
			     
			                                                                        double price=Double.parseDouble((((ProdutoContext)_localctx).preco!=null?_input.getText(((ProdutoContext)_localctx).preco.start,((ProdutoContext)_localctx).preco.stop):null));  
			                                                                        Produto p = new Produto(((ProdutoContext)_localctx).ref.refOut,(((ProdutoContext)_localctx).desc!=null?_input.getText(((ProdutoContext)_localctx).desc.start,((ProdutoContext)_localctx).desc.stop):null),price,((ProdutoContext)_localctx).quantidade.quantidadeOut);
			                                                                        _localctx.productsIn.put(((ProdutoContext)_localctx).ref.refOut,p);

			                                                                        
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

	public static class NumeroContext extends ParserRuleContext {
		public int numeroOut;
		public Token NUMERO;
		public TerminalNode NUMERO() { return getToken(FaturasParser.NUMERO, 0); }
		public NumeroContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_numero; }
	}

	public final NumeroContext numero() throws RecognitionException {
		NumeroContext _localctx = new NumeroContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_numero);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(79);
			((NumeroContext)_localctx).NUMERO = match(NUMERO);
			 ((NumeroContext)_localctx).numeroOut =  (((NumeroContext)_localctx).NUMERO!=null?Integer.valueOf(((NumeroContext)_localctx).NUMERO.getText()):0);
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

	public static class NifContext extends ParserRuleContext {
		public TerminalNode NUMERO() { return getToken(FaturasParser.NUMERO, 0); }
		public NifContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_nif; }
	}

	public final NifContext nif() throws RecognitionException {
		NifContext _localctx = new NifContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_nif);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(82);
			match(NUMERO);
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

	public static class NibContext extends ParserRuleContext {
		public TerminalNode NUMERO() { return getToken(FaturasParser.NUMERO, 0); }
		public NibContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_nib; }
	}

	public final NibContext nib() throws RecognitionException {
		NibContext _localctx = new NibContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_nib);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(84);
			match(NUMERO);
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

	public static class NomeContext extends ParserRuleContext {
		public TerminalNode PALAVRA() { return getToken(FaturasParser.PALAVRA, 0); }
		public NomeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_nome; }
	}

	public final NomeContext nome() throws RecognitionException {
		NomeContext _localctx = new NomeContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_nome);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(86);
			match(PALAVRA);
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

	public static class MoradaContext extends ParserRuleContext {
		public TerminalNode PALAVRA() { return getToken(FaturasParser.PALAVRA, 0); }
		public MoradaContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_morada; }
	}

	public final MoradaContext morada() throws RecognitionException {
		MoradaContext _localctx = new MoradaContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_morada);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(88);
			match(PALAVRA);
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

	public static class RefContext extends ParserRuleContext {
		public int refOut;
		public Token NUMERO;
		public TerminalNode NUMERO() { return getToken(FaturasParser.NUMERO, 0); }
		public RefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_ref; }
	}

	public final RefContext ref() throws RecognitionException {
		RefContext _localctx = new RefContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_ref);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(90);
			((RefContext)_localctx).NUMERO = match(NUMERO);
			 ((RefContext)_localctx).refOut =  (((RefContext)_localctx).NUMERO!=null?Integer.valueOf(((RefContext)_localctx).NUMERO.getText()):0);
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

	public static class QuantidadeContext extends ParserRuleContext {
		public int quantidadeOut;
		public Token NUMERO;
		public TerminalNode NUMERO() { return getToken(FaturasParser.NUMERO, 0); }
		public QuantidadeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_quantidade; }
	}

	public final QuantidadeContext quantidade() throws RecognitionException {
		QuantidadeContext _localctx = new QuantidadeContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_quantidade);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(93);
			((QuantidadeContext)_localctx).NUMERO = match(NUMERO);
			 ((QuantidadeContext)_localctx).quantidadeOut =  (((QuantidadeContext)_localctx).NUMERO!=null?Integer.valueOf(((QuantidadeContext)_localctx).NUMERO.getText()):0);
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

	public static class DescContext extends ParserRuleContext {
		public TerminalNode PALAVRA() { return getToken(FaturasParser.PALAVRA, 0); }
		public DescContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_desc; }
	}

	public final DescContext desc() throws RecognitionException {
		DescContext _localctx = new DescContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_desc);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(96);
			match(PALAVRA);
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

	public static class PrecoContext extends ParserRuleContext {
		public TerminalNode NUMERO() { return getToken(FaturasParser.NUMERO, 0); }
		public PrecoContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_preco; }
	}

	public final PrecoContext preco() throws RecognitionException {
		PrecoContext _localctx = new PrecoContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_preco);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(98);
			match(NUMERO);
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\5g\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t\13\4"+
		"\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22\3\2\3"+
		"\2\3\2\6\2(\n\2\r\2\16\2)\3\3\3\3\3\3\6\3/\n\3\r\3\16\3\60\3\3\3\3\3\4"+
		"\3\4\3\4\3\4\3\4\3\5\3\5\3\5\3\5\3\5\3\6\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3"+
		"\b\6\bH\n\b\r\b\16\bI\3\t\3\t\3\t\3\t\3\t\3\t\3\n\3\n\3\n\3\13\3\13\3"+
		"\f\3\f\3\r\3\r\3\16\3\16\3\17\3\17\3\17\3\20\3\20\3\20\3\21\3\21\3\22"+
		"\3\22\3\22\2\2\23\2\4\6\b\n\f\16\20\22\24\26\30\32\34\36 \"\2\2\2X\2$"+
		"\3\2\2\2\4+\3\2\2\2\6\64\3\2\2\2\b9\3\2\2\2\n>\3\2\2\2\fB\3\2\2\2\16G"+
		"\3\2\2\2\20K\3\2\2\2\22Q\3\2\2\2\24T\3\2\2\2\26V\3\2\2\2\30X\3\2\2\2\32"+
		"Z\3\2\2\2\34\\\3\2\2\2\36_\3\2\2\2 b\3\2\2\2\"d\3\2\2\2$%\5\16\b\2%\'"+
		"\b\2\1\2&(\5\4\3\2\'&\3\2\2\2()\3\2\2\2)\'\3\2\2\2)*\3\2\2\2*\3\3\2\2"+
		"\2+,\5\6\4\2,.\b\3\1\2-/\5\f\7\2.-\3\2\2\2/\60\3\2\2\2\60.\3\2\2\2\60"+
		"\61\3\2\2\2\61\62\3\2\2\2\62\63\b\3\1\2\63\5\3\2\2\2\64\65\5\22\n\2\65"+
		"\66\5\b\5\2\66\67\5\n\6\2\678\b\4\1\28\7\3\2\2\29:\5\30\r\2:;\5\24\13"+
		"\2;<\5\32\16\2<=\5\26\f\2=\t\3\2\2\2>?\5\30\r\2?@\5\24\13\2@A\5\32\16"+
		"\2A\13\3\2\2\2BC\5\34\17\2CD\5\36\20\2DE\b\7\1\2E\r\3\2\2\2FH\5\20\t\2"+
		"GF\3\2\2\2HI\3\2\2\2IG\3\2\2\2IJ\3\2\2\2J\17\3\2\2\2KL\5\34\17\2LM\5 "+
		"\21\2MN\5\"\22\2NO\5\36\20\2OP\b\t\1\2P\21\3\2\2\2QR\7\4\2\2RS\b\n\1\2"+
		"S\23\3\2\2\2TU\7\4\2\2U\25\3\2\2\2VW\7\4\2\2W\27\3\2\2\2XY\7\3\2\2Y\31"+
		"\3\2\2\2Z[\7\3\2\2[\33\3\2\2\2\\]\7\4\2\2]^\b\17\1\2^\35\3\2\2\2_`\7\4"+
		"\2\2`a\b\20\1\2a\37\3\2\2\2bc\7\3\2\2c!\3\2\2\2de\7\4\2\2e#\3\2\2\2\5"+
		")\60I";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}