unit UAtualizaFreteComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, DBCtrls;

type
  TFAtualizaFreteComissao = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BtConfirmar: TBitBtn;
    MeValFrete: TMaskEdit;
    procedure BtConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtualizaFreteComissao: TFAtualizaFreteComissao;

implementation

uses UNotaSaida_cl, UOracle_cl, UBiblioteca;

{$R *.dfm}

procedure TFAtualizaFreteComissao.BtConfirmarClick(Sender: TObject);
Var wComando : String;
begin
  If DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text = '' Then
     Raise exception.Create('Selecionar uma nota fiscal');
  Try
    DMOracle.DBCemapa.StartTransaction;
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    wComando := 'UPDATE TB_NOTA_CAB SET VAL_FRETE_COMISSAO = ' + Bib.TrocaVirgulaPorPonto(Trim(MeValFrete.Text)) +
                        ' WHERE COD_NOTA_CAB= '+DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text;
    DMOracle.QExecSQL.SQL.Add(wComando);
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
    ShowMessage('Valor atualizado com sucesso');
    MeValFrete.Clear;
  except
    DMOracle.DBCemapa.Rollback;
    Raise exception.Create('não atualizado - ocorreu um erro');
  End;
end;


end.
