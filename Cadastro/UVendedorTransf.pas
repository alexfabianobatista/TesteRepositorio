unit UVendedorTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFVendedorTransf = class(TForm)
    GroupBox1: TGroupBox;
    SBVendedorDe: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    SBVendedorPara: TSpeedButton;
    MeVendedorDe: TMaskEdit;
    MeVendedorPara: TMaskEdit;
    EdVendedorDe: TEdit;
    EdVendedorPara: TEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    GroupBox2: TGroupBox;
    MECidade: TMaskEdit;
    SBCidade: TSpeedButton;
    EdCidade: TEdit;
    procedure SBVendedorDeClick(Sender: TObject);
    procedure SBVendedorParaClick(Sender: TObject);
    procedure MeVendedorDeExit(Sender: TObject);
    procedure MeVendedorParaExit(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure SBCidadeClick(Sender: TObject);
    procedure MECidadeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendedorTransf: TFVendedorTransf;

implementation

uses UVendedorCons, UVendedor_cl, UOracle_cl, UCidadeCons, UCidade_cl;

{$R *.DFM}

procedure TFVendedorTransf.SBVendedorDeClick(Sender: TObject);
begin
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    MEVendedorDe.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    MEVendedorDeExit(Self);
  End;
end;

procedure TFVendedorTransf.SBVendedorParaClick(Sender: TObject);
begin
 If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    MEVendedorPara.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    MEVendedorParaExit(Self);
  End;
end;

procedure TFVendedorTransf.MeVendedorDeExit(Sender: TObject);
begin
  If Trim(MeVendedorDe.Text) <> '' Then
    EdVendedorDe.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(MeVendedorDe.Text));
end;

procedure TFVendedorTransf.MeVendedorParaExit(Sender: TObject);
begin
  If Trim(MeVendedorPara.Text) <> '' Then
    EdVendedorPara.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(MeVendedorPara.Text));
end;

procedure TFVendedorTransf.BtOkClick(Sender: TObject);
begin
  If Trim(MeCidade.Text) = '' Then  //ALTERADO MARCOS 21/11/2005
  begin
    DMOracle.QExecSql.Close;
    DMOracle.QExecSql.Sql.Clear;
    DMOracle.QExecSql.Sql.Add('Update TB_CADASTRO set COD_VENDEDOR = ' + Trim(MeVendedorPara.Text) +
                     ' Where COD_VENDEDOR = '+Trim(MeVendedorDe.Text));
    DMOracle.QExecSql.ExecSql;

    If DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  end
  else
  begin
    DMOracle.QExecSql.Close;
    DMOracle.QExecSql.Sql.Clear;
    DMOracle.QExecSql.Sql.Add('Update TB_CADASTRO set COD_VENDEDOR = ' + Trim(MeVendedorPara.Text) +
                     ' Where COD_VENDEDOR = '+Trim(MeVendedorDe.Text) + 'and COD_CIDADE = ' + Trim(MeCidade.Text));
    DMOracle.QExecSql.ExecSql;

    If DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  end;
end;

procedure TFVendedorTransf.SBCidadeClick(Sender: TObject);
begin
   If FCidadeCons = Nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  If FCidadeCons.ShowModal = mrOk then
  Begin
    MECidade.Text := DMCidade.QCidadeConsCod_Cidade.Text;
    MECidadeExit(Self);
  End;

end;

procedure TFVendedorTransf.MECidadeExit(Sender: TObject);
begin
  If Trim(MeCidade.Text) <> '' Then
    EdCidade.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE',
                                              'COD_CIDADE = '+Trim(MeCidade.Text))
  Else
    EdCidade.Text := 'Todas';

end;

end.
