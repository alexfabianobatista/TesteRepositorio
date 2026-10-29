unit UVenda_Regiao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, variants;

type
  TFVenda_regiao = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    SBFilialCons: TBitBtn;
    SBVendedorCons: TBitBtn;
    SBRegiaoCons: TBitBtn;
    EdFilialDesc: TEdit;
    EdVendedorDesc: TEdit;
    EdRegiaoDesc: TEdit;
    DBEdit7: TDBEdit;
    Vendaporvendedorregio1: TMenuItem;
    procedure DBEdit2Change(Sender: TObject);
    procedure SBFilialConsClick(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure SBVendedorConsClick(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure SBRegiaoConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure Vendaporvendedorregio1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVenda_regiao: TFVenda_regiao;
  
implementation

uses UVendedor_cl, UOracle_cl, UFilial_cl, UFilialCons, UVendedorCons,
  URegiaoCons, URegiao_cl, UVenda_regiaoCons, UNotaSaidaParam,
  URVenda_regiao, UUsuario_cl;

{$R *.DFM}

procedure TFVenda_regiao.DBEdit2Change(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit2.Text) <> '' then
  begin
    EdFilialDesc.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
          'TB_FILIAL.COD_FILIAL = '+DBEdit2.Text);
  end
  else
     EdFilialDesc.Text := '';
end;

procedure TFVenda_regiao.SBFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    with DMFilial do
    begin
      DBEdit2.Text := QFilialConsCOD_FILIAL.Text;
      EdFilialDesc.Text := QFilialConsDESC_FILIAL.Value;
    end;
  end
  else
  begin
    DBEdit2.Text := '';
    EdFilialDesc.Text := '';
  end;
end;

procedure TFVenda_regiao.DBEdit3Change(Sender: TObject);
begin
  inherited;
 if Trim(DBEdit3.Text) <> '' then
  begin
    EdVendedorDesc.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
          'TB_VENDEDOR.COD_VENDEDOR = '+DBEdit3.Text);
  end
  else
     EdVendedorDesc.Text := '';
end;

procedure TFVenda_regiao.SBVendedorConsClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    with DMVendedor do
    begin
      DBEdit3.Text := QVendedorConsCOD_VENDEDOR.Text;
      EdVendedorDesc.Text := QVendedorConsNOME.Value;
    end;
  end
  else
  begin
    DBEdit3.Text := '';
    EdVendedorDesc.Text := '';
  end;
end;

procedure TFVenda_regiao.DBEdit4Change(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit4.Text) <> '' then
  begin
    EdRegiaoDesc.Text := DMOracle.BuscaNome('SELECT DESC_REGIAO FROM TB_REGIAO',
          'TB_REGIAO.COD_REGIAO = '+DBEdit4.Text);
  end
  else
     EdRegiaoDesc.Text := '';
end;

procedure TFVenda_regiao.SBRegiaoConsClick(Sender: TObject);
begin
  inherited;
  if FRegiaoCons = nil then
     FRegiaoCons := TFRegiaoCons.Create(Application);
  if FRegiaoCons.ShowModal = mrOk then
  begin
    with DMRegiao do
    begin
      DBEdit4.Text := QRegiaoConsCOD_REGIAO.Text;
      EdRegiaoDesc.Text := QRegiaoConsDESC_REGIAO.Value;
    end;
  end
  else
  begin
    DBEdit4.Text := '';
    EdRegiaoDesc.Text := '';
  end;
end;

procedure TFVenda_regiao.FormActivate(Sender: TObject);
begin
  inherited;
  with DMVendedor do
  begin
    QVenda_Regiao.Close;
    QVenda_Regiao.Open;
    DBEdit5.Text := Copy(DateToStr(DATE),4,2);
    DBEdit7.Text := Copy(DateToStr(DATE),7,4);
  end;
end;

procedure TFVenda_regiao.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FVenda_regiaoCons = nil then
     FVenda_regiaoCons := TFVenda_regiaoCons.Create(Application);
  if FVenda_regiaoCons.ShowModal = mrOk then
  begin
    with DMVendedor do
    begin
      QVenda_Regiao.Close;
      QVenda_Regiao.SetVariable('PK',QVenda_regiaoConsCOD_VENDA_REGIAO.Value);
      QVenda_Regiao.Open;
    end;
  end;
end;

procedure TFVenda_regiao.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit5.Text) <> '' then
  begin
    if (StrToFloat(DBEdit5.Text) < 1) or
       (StrToFloat(DBEdit5.Text) > 12) then
    begin
      MessageDlg('Não é um mës valido!',mtInformation,[mbOk],0);
      DBEdit5.Text := '';
    end;
  end;
end;

procedure TFVenda_regiao.Vendaporvendedorregio1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[30].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.MEFilialCod.Text),'VENDA');
    with DMVendedor do
    begin
      QRVenda_Regiao.Close;

      if (Trim(FNotaSaidaParam.MEDataI.Text) = '') or (Trim(FNotaSaidaParam.MEDataF.Text) = '') then
         raise exception.Create('Periodo deve ser informado!');

      if Trim(FNotaSaidaParam.MEFilialCod.Text) = '' then
         QRVenda_Regiao.SetVariable('COD_FILIAL',Null)
      else
         QRVenda_Regiao.SetVariable('COD_FILIAL',FNotaSaidaParam.MEFilialCod.Text);

      if Trim(FNotaSaidaParam.MEVendedorCod.Text) = '' then
         QRVenda_Regiao.SetVariable('COD_VENDEDOR',Null)
      else
         QRVenda_Regiao.SetVariable('COD_VENDEDOR',FNotaSaidaParam.MEVendedorCod.Text);

      if Trim(FNotaSaidaParam.MERegiaoCod.Text) = '' then
         QRVenda_Regiao.SetVariable('COD_REGIAO',Null)
      else
         QRVenda_Regiao.SetVariable('COD_REGIAO',FNotaSaidaParam.MERegiaoCod.Text);

      QRVenda_regiao.SetVariable('DATA_I',FNotaSaidaParam.MEDataI.Text);
      QRVenda_regiao.SetVariable('DATA_F',FNotaSaidaParam.MEDataF.Text);

      QRVenda_Regiao.SetVariable('NUM_MES_I',Copy(FNotaSaidaParam.MEDataI.Text,4,2));
      QRVenda_Regiao.SetVariable('NUM_ANO_I',Copy(FNotaSaidaParam.MEDataI.Text,7,4));
      QRVenda_Regiao.SetVariable('NUM_MES_F',Copy(FNotaSaidaParam.MEDataF.Text,4,2));
      QRVenda_Regiao.SetVariable('NUM_ANO_F',Copy(FNotaSaidaParam.MEDataF.Text,7,4));

      QRVenda_Regiao.Open;

      if FRVenda_Regiao = nil then
         FRVenda_Regiao := TFRVenda_Regiao.Create(Application);

      FRVenda_Regiao.QRLTitulo.Caption := 'VENDA POR REGIÃO / KG P/HABITANTE ANO DE ' + Copy(FNotaSaidaParam.MEDataF.Text,7,4);

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
         FRVenda_Regiao.QRPrimario.Preview
      else
         FRVenda_Regiao.QRPrimario.Print;

      QRVenda_Regiao.Close;
      
    end;
  end;
end;

procedure TFVenda_regiao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMVendedor do
    QVenda_Regiao.Close;
  Action := CaFree;
  FVenda_regiao := Nil;
end;

procedure TFVenda_regiao.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMVendedor.QVenda_RegiaoCOD_FILIAL.Text),'VENDA');
  inherited;                                                                              
end;

procedure TFVenda_regiao.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBFilialCons.Enabled:=DSPrimario.State<>dsBrowse;
  SBVendedorCons.Enabled:=DSPrimario.State<>dsBrowse;
  SBRegiaoCons.Enabled:=DSPrimario.State<>dsBrowse;
end;

end.
