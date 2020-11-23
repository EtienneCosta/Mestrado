// Generated from ListasMistas.g4 by ANTLR 4.8
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link ListasMistasParser}.
 */
public interface ListasMistasListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link ListasMistasParser#listas}.
	 * @param ctx the parse tree
	 */
	void enterListas(ListasMistasParser.ListasContext ctx);
	/**
	 * Exit a parse tree produced by {@link ListasMistasParser#listas}.
	 * @param ctx the parse tree
	 */
	void exitListas(ListasMistasParser.ListasContext ctx);
	/**
	 * Enter a parse tree produced by {@link ListasMistasParser#lista}.
	 * @param ctx the parse tree
	 */
	void enterLista(ListasMistasParser.ListaContext ctx);
	/**
	 * Exit a parse tree produced by {@link ListasMistasParser#lista}.
	 * @param ctx the parse tree
	 */
	void exitLista(ListasMistasParser.ListaContext ctx);
	/**
	 * Enter a parse tree produced by {@link ListasMistasParser#exps}.
	 * @param ctx the parse tree
	 */
	void enterExps(ListasMistasParser.ExpsContext ctx);
	/**
	 * Exit a parse tree produced by {@link ListasMistasParser#exps}.
	 * @param ctx the parse tree
	 */
	void exitExps(ListasMistasParser.ExpsContext ctx);
	/**
	 * Enter a parse tree produced by {@link ListasMistasParser#exp}.
	 * @param ctx the parse tree
	 */
	void enterExp(ListasMistasParser.ExpContext ctx);
	/**
	 * Exit a parse tree produced by {@link ListasMistasParser#exp}.
	 * @param ctx the parse tree
	 */
	void exitExp(ListasMistasParser.ExpContext ctx);
}