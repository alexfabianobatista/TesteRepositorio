unit UVenda_regiaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, variants;

type
  TFVenda_regiaoCons = class(TForm)
    Label2: TLabel;
    SBFilialCons: TBitBtn;
    EdFilialDesc: TEdit;
    Label3: TLabel;
    SBVendedorCons: TBitBtn;
    EdVendedorDesc: TEdit;
    SBRegiaoCons: TBitBtn;
    EdRegiaoDesc: TEdit;
    EdFilialCod: TEdit;
    EdVendedorCod: TEdit;
    EdRegiaoCod: TEdit;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DS_Consulta: TDataSource;
    BtnOk: TBitBtn;
    BtnCancelar: TBitBtn;
    Label1: TLabel;
    BtnProcurar: TBitBtn;
    Label4: TLabel;
    EdMes: TEdit;
    EdAno: TEdit;
    procedure EdFilialCodChange(Sender: TObject);
    procedure EdVendedorCodChange(Sender: TObject);
    procedure EdRegiaoCodChange(Sender: TObject);
    procedure SBFilialConsClick(Sender: TObject);
    procedure SBVendedorConsClick(Sender: TObject);
    procedure SBRegiaoConsClick(Sender: TObject);
    procedure BtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVenda_regiaoCons: TFVenda_regiaoCons;

implementation

uses UVendedor_cl, UOracle_cl, UFilialCons, UFilial_cl, UVendedorCons,
  URegiaoCons, URegiao_cl, UUsuario_cl;

{$R *.DFM}

procedure TFVenda_regiaoCons.EdFilialCodChange(Sender: TObject);
begin
 if Trim(EdFilialCod.Text) <> '' then
  begin
    EdFilialDesc.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
          'TB_FILIAL.COD_FILIAL = '+EdFilialCod.Text);
  end
  else
     EdFilialDesc.Text := '';
end;

procedure TFVenda_regiaoCons.EdVendedorCodChange(Sender: TObject);
begin
 if Trim(EdVendedorCod.Text) <> '' then
  begin
    EdVendedorDesc.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
          'TB_VENDEDOR.COD_VENDEDOR = '+EdVendedorCod.Text);
  end
  else
     EdVendedorDesc.Text := '';
end;

procedure TFVenda_regiaoCons.EdRegiaoCodChange(Sender: TObject);
begin
  if Trim(EdRegiaoCod.Text) <> '' then
  begin
    EdRegiaoDesc.Text := DMOracle.BuscaNome('SELECT DESC_REGIAO FROM TB_REGIAO',
          'TB_REGIAO.COD_REGIAO = '+EdRegiaoCod.Text);
  end
  else
     EdRegiaoDesc.Text := '';
end;

procedure TFVenda_regiaoCons.SBFilialConsClick(Sender: TObject);
begin
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    with DMFilial do
    begin
      EdFilialCod.Text := QFilialConsCOD_FILIAL.Text;
      EdFilialDesc.Text := QFilialConsDESC_FILIAL.Value;
    end;
  end
  else
  begin
    EdFilialCod.Text := '';
    EdFilialDesc.Text := '';
  end;
end;

procedure TFVenda_regiaoCons.SBVendedorConsClick(Sender: TObject);
begin
  if FVendedorCons = nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    with DMVendedor do
    begin
      EdVendedorCod.Text := QVendedorConsCOD_VENDEDOR.Text;
      EdVendedorDesc.Text := QVendedorConsNOME.Value;
    end;
  end
  else
  begin
    EdVendedorCod.Text := '';
    EdVendedorDesc.Text := '';
  end;
end;

procedure TFVenda_regiaoCons.SBRegiaoConsClick(Sender: TObject);
begin
  if FRegiaoCons = nil then
     FRegiaoCons := TFRegiaoCons.Create(Application);
  if FRegiaoCons.ShowModal = mrOk then
  begin
    with DMRegiao do
    begin
      EdRegiaoCod.Text := QRegiaoConsCOD_REGIAO.Text;
      EdRegiaoDesc.Text := QRegiaoConsDESC_REGIAO.Value;
    end;
  end
  else
  begin
    EdRegiaoCod.Text := '';
    EdRegiaoDesc.Text := '';
  end;
end;

procedure TFVenda_regiaoCons.BtnProcurarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(EdFilialCod.Text),'VENDA');
  with DMVendedor do
  begin
    QVenda_RegiaoCons.Close;
    if Trim(EdFilialCod.Text) = '' then
       QVenda_regiaoCons.SetVariable('COD_FILIAL',Null)
    else
       QVenda_RegiaoCons.SetVariable('COD_FILIAL',EdFilialCod.Text);

    if Trim(EdVendedorCod.Text) = '' then
       QVenda_regiaoCons.SetVariable('COD_VENDEDOR',Null)
    else
       QVenda_RegiaoCons.SetVariable('COD_VENDEDOR',EdVendedorCod.Text);

    if Trim(EdRegiaoCod.Text) = '' then
       QVenda_regiaoCons.SetVariable('COD_REGIAO',Null)
    else
       QVenda_RegiaoCons.SetVariable('COD_REGIAO',EdFilialCod.Text);

    if Trim(EdMes.Text) = '' then
       QVenda_RegiaoCons.SetVariable('NUM_MES',Null)
    else
       QVenda_RegiaoCons.SetVariable('NUM_MES',EdMes.Text);

    if Trim(EdAno.Text) = '' then
       QVenda_RegiaoCons.SetVariable('NUM_ANO',Null)
    else
       QVenda_RegiaoCons.SetVariable('NUM_ANO',EdAno.Text);

    QVenda_RegiaoCons.Open;

  end;
end;

end.
