unit ULancaComponente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, Buttons, StdCtrls, UFmProduto;

type
  TFLancaComponente = class(TForm)
    FmProduto1: TFmProduto;
    EdQtdade: TEdit;
    Label1: TLabel;
    SBConfirma: TSpeedButton;
    procedure FmProduto1BtProdutoClick(Sender: TObject);
    procedure SBConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLancaComponente: TFLancaComponente;

implementation

uses UOracle_cl, UFormula_cl, UEstoque_cl;

{$R *.dfm}

procedure TFLancaComponente.FmProduto1BtProdutoClick(Sender: TObject);
begin
  FmProduto1.BtProdutoClick(Sender);

end;

procedure TFLancaComponente.SBConfirmaClick(Sender: TObject);

begin
  if ((Trim(FMProduto1.MeProduto.Text) = '') or (Trim(EdQtdade.Text) = '')) then
    Raise Exception.Create('Preencha os Campos!')
  else
  Begin
    DMFormula.QRRelacaoFormula.Close;
    DMFormula.QRRelacaoFormula.SetVariable('PRODUTO',FMProduto1.MeProduto.Text);
    DMFormula.QRRelacaoFormula.Open;
    DMFormula.QRRelacaoFormula.First;
    Try
      DMoracle.DBCemapa.StartTransaction;
      while not DMFormula.QRRelacaoFormula.EOF do
      Begin
        with DMEstoque do
        begin
          DMEstoque.AtualizaEstoque(-1,1,StrToInt(DMFormula.QRRelacaoFormulaCOMPONENTE.Text),
                                  310,(DMFormula.QRRelacaoFormulaQT_ITEM.Value * STrToInt(EdQtdade.Text)),0,0,0);
          DMOracle.DBCemapa.Commit;
        end;
        DMFormula.QRRelacaoFormula.Next;
      end;
    ShowMessage('Estoque de Componentes Atualizado!');  
    except
      DMOracle.DBCemapa.Rollback;
      Raise Exception.Create('Erro! Estoque não atualizado!');
    end;
  end;  
end;

end.
