unit UExcluiProducao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFExcluiProducao = class(TForm)
    MEProduto: TMaskEdit;
    MEDescProduto: TMaskEdit;
    MEOrigem: TMaskEdit;
    MEDescOrigem: TMaskEdit;
    MEQuantidade: TMaskEdit;
    MEDtLancto: TMaskEdit;
    MENota: TMaskEdit;
    MEControle: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RGLinhaCons: TRadioGroup;
    RGTurnoCons: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExcluiProducao: TFExcluiProducao;

implementation

uses UOracle_cl, UEstoque_cl;

{$R *.DFM}

procedure TFExcluiProducao.BitBtn1Click(Sender: TObject);
begin
  Try
    DMoracle.DBCemapa.StartTransaction;
    with DMEstoque do
    begin
      if (Trim(QEstoqueProducaoQt_Estoque_Producao.Text) <> '') and (Trim(QEstoqueProducaoCod_Produto.Text) <> '') and
         (Trim(QEstoqueProducaoCod_Lote_Tipo.Text) <> '')    and (Trim(QEstoqueProducaoCod_Filial.Text) <> '') then
      begin

        DMEstoque.AtualizaEstoque(-1,QEstoqueProducaoCod_Filial.Value,QEstoqueProducaoCod_Produto.Value,
                                QEstoqueProducaoCod_Lote_Tipo.value,(QEstoqueProducaoQt_Estoque_Producao.Value*-1),0,0,0);
        QEstoqueProducao.Delete;

        DMOracle.DBCemapa.Commit;
        FExcluiProducao.MEProduto.Text:='';
        FExcluiProducao.MEDescProduto.Text:='';
        FExcluiProducao.MEOrigem.Text:='';
        FExcluiProducao.MEDescOrigem.Text:='';
        FExcluiProducao.MEDtLancto.Text:='';
        FExcluiProducao.MEQuantidade.Text:='';
        FExcluiProducao.MENota.Text:='';
        FExcluiProducao.MEControle.Text:='';
      end;
    end;
  except
    ShowMessage('Erro na exclusão da produção');
    DMOracle.DBCemapa.Rollback;
    raise;
  end;
end;
end.
