unit UBibAssistencia;

interface

uses Forms, Dialogs, SysUtils, OracleData, TypInfo, DB;

type TBibAssistencia = class
  private

  public
    function VerificaEstoqueNegativo(var lista: string) : boolean;
end;

implementation

uses UParamSistema_cl, UOracle_cl, UCadastro_cl, UOrdemServico_cl, UProduto_cl,
     UFilial_cl, UEstoque_cl;

{ TBibAssistencia }

function TBibAssistencia.VerificaEstoqueNegativo(var lista: string): boolean;
var
  wSituacao: boolean;
  wQtEstoque: double;
begin
  wSituacao:= false;
  lista := '';

  //Verifica itens com estoque negativo. Não salva OS enquanto não consertar o item em tela.
  with DMOracle, DMOrdemServico, DMEstoque, DMFilial, DMParamSistema do
  begin
    if QFilial.State in [dsInactive] then
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', QOrdemServicoCOD_FILIAL.Value);
      QFilial.Open;
    end;

    if (QFilialIND_ESTOQUE_NEGATIVO.Text = 'NAO') and (QParamSistemaIND_CONTROLE_ESTOQUE_OS.Value = 'SIM') then
    begin
      QOrdemServicoIt.DisableControls;
      QOrdemServicoIt.First;

      while not QOrdemServicoIt.Eof do
      begin
        wQtEstoque := StrToFloat(FastSelect('QT_QUANTIDADE', 'TB_ESTOQUE', 'COD_PRODUTO = ' + QOrdemServicoItCOD_PRODUTO.Text
                                                                        +  'and COD_LOTE_TIPO = ' + QOrdemServicoItCOD_LOTE_TIPO.Text
                                                                        +  'and COD_FILIAL = ' + QFilialCOD_FILIAL.Text));
        if wQtEstoque < QOrdemServicoItQT_PRODUTO.Value then
        begin
          lista := lista + #13 + QOrdemServicoItCOD_PRODUTO.Text + ': ' + QOrdemServicoItnome_produto.Text + '  - Lote: ' +QOrdemServicoItCOD_LOTE_TIPO.Text;
          wSituacao := true;
        end;

        QOrdemServicoIt.Next;
      end;
      QOrdemServicoIt.EnableControls;
    end;
  end;

  result := wSituacao;
end;

end.

