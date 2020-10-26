// Generated from Turma.g4 by ANTLR 4.8
 
import java.util.* ;

import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link TurmaParser}.
 */
public interface TurmaListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link TurmaParser#turmas}.
	 * @param ctx the parse tree
	 */
	void enterTurmas(TurmaParser.TurmasContext ctx);
	/**
	 * Exit a parse tree produced by {@link TurmaParser#turmas}.
	 * @param ctx the parse tree
	 */
	void exitTurmas(TurmaParser.TurmasContext ctx);
	/**
	 * Enter a parse tree produced by {@link TurmaParser#turma}.
	 * @param ctx the parse tree
	 */
	void enterTurma(TurmaParser.TurmaContext ctx);
	/**
	 * Exit a parse tree produced by {@link TurmaParser#turma}.
	 * @param ctx the parse tree
	 */
	void exitTurma(TurmaParser.TurmaContext ctx);
	/**
	 * Enter a parse tree produced by {@link TurmaParser#aluno}.
	 * @param ctx the parse tree
	 */
	void enterAluno(TurmaParser.AlunoContext ctx);
	/**
	 * Exit a parse tree produced by {@link TurmaParser#aluno}.
	 * @param ctx the parse tree
	 */
	void exitAluno(TurmaParser.AlunoContext ctx);
	/**
	 * Enter a parse tree produced by {@link TurmaParser#notas}.
	 * @param ctx the parse tree
	 */
	void enterNotas(TurmaParser.NotasContext ctx);
	/**
	 * Exit a parse tree produced by {@link TurmaParser#notas}.
	 * @param ctx the parse tree
	 */
	void exitNotas(TurmaParser.NotasContext ctx);
	/**
	 * Enter a parse tree produced by {@link TurmaParser#nota}.
	 * @param ctx the parse tree
	 */
	void enterNota(TurmaParser.NotaContext ctx);
	/**
	 * Exit a parse tree produced by {@link TurmaParser#nota}.
	 * @param ctx the parse tree
	 */
	void exitNota(TurmaParser.NotaContext ctx);
}