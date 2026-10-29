unit UMaquinaManuCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFMaquinaManuCad = class(TFTCadSimples)
    Label1: TLabel;
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
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBRadioGroup1: TDBRadioGroup;
    SBObra: TSpeedButton;
    EdObra: TEdit;
    RelaodeManuteno1: TMenuItem;
    RelaodasPrximasManutenes1: TMenuItem;
    procedure DBEdit3Exit(Sender: TObject);
    procedure SBObraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBComboBox1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeManuteno1Click(Sender: TObject);
    procedure RelaodasPrximasManutenes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMaquinaManuCad: TFMaquinaManuCad;

implementation

uses UMaquinaManu_cl, UOracle_cl, UObraCons, UObra_cl, UMaquinaManuCons,
  UObra_Param, URMaquinaManu, URMaquinaProxManu;

{$R *.DFM}

procedure TFMaquinaManuCad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit3.Text) <> '' then
  begin
    EdObra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA','COD_OBRA = '+DBEdit3.Text);
    if DMOracle.BuscaNome('SELECT IND_KM_HR FROM TB_OBRA','COD_OBRA = '+DBEdit3.Text) = 'KM' then
    begin
      DBEdit4.Enabled := True;
      DBEdit5.Enabled := False;
      DMMaquinaManu.QMaquinaManuCadKM.Text := DMOracle.BuscaNome('SELECT VAL_MARCADOR FROM TB_OBRA','COD_OBRA = '+DBEdit3.Text);
    end
    else
    begin
      DBEdit4.Enabled := False;
      DBEdit5.Enabled := True;
      DMMaquinaManu.QMaquinaManuCadHORAS.Text := DMOracle.BuscaNome('SELECT VAL_MARCADOR FROM TB_OBRA','COD_OBRA = '+DBEdit3.Text);
    end;
  end
  else
    EdObra.Text := '';
end;

procedure TFMaquinaManuCad.SBObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons = nil then
    FObraCons := TFObraCons.Create(Application);
  if FObraCons.showModal = mrOk then
  begin
    DMMaquinaManu.QMaquinaManuCadCOD_OBRA.value := DMObra.QObra_consCOD_OBRA.value;
    DBEdit3Exit(Self);
 end;   

end;

procedure TFMaquinaManuCad.FormActivate(Sender: TObject);
begin
  inherited;
   DSPrimario.Dataset.open; 
end;

procedure TFMaquinaManuCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DSPrimario.DataSet.Close;
end;

procedure TFMaquinaManuCad.DBComboBox1Click(Sender: TObject);
begin
  inherited;
  if DBComboBox1.text='PNEU' then
  begin
    DBRadioGroup1.visible:= true;
    DBEdit8.visible:=true;
    Label8.visible:= true;
  end
  else
  begin
    DBRadioGroup1.visible:= false;
    DBEdit8.visible:= false;
    Label8.visible:= false;
  end;
end;

procedure TFMaquinaManuCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBObra.Enabled := SBConfirmar.Enabled;
  DBComboBox1Click(Self);
  DBEdit3Exit(Self);
end;

procedure TFMaquinaManuCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBComboBox1.SetFocus;
end;

procedure TFMaquinaManuCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMaquinaManuCons = nil then
    FMaquinaManuCons := TFMaquinaManuCons.Create(Application);
  if FMaquinaManuCons.showModal = mrOk then
  begin
    DSPrimario.DataSet.Close;
    DMMaquinaManu.QMaquinaManuCad.SetVariable('PK',DMMaquinaManu.QMaquinaManuConsCOD_MAQUINA_MANU.Text);
    DSPrimario.DataSet.Open;
  end;
end;
procedure TFMaquinaManuCad.RelaodeManuteno1Click(Sender: TObject);
begin
  inherited;
 if FObra_Param = Nil then
    FObra_Param := TFObra_Param.Create(Application);
  FObra_Param.PGRelatorio.Pages[3].TabVisible := True;
  if FObra_Param.ShowModal = mrOk then
  with DMMaquinaManu do
  begin
    QRMaquinaManu.Close;
    if Trim(FObra_Param.CB4Tipo.Text) = 'TODOS' then
      QRMaquinaManu.SetVariable('IND_TIPO',Null)
    else
      QRMaquinaManu.SetVariable('IND_TIPO',FObra_Param.CB4Tipo.Text);
    if Trim(FObra_Param.ME4Filial.Text) = '' then
      QRMaquinaManu.SetVariable('FILIAL',Null)
    else
      QRMaquinaManu.SetVariable('FILIAL',StrToInt(Trim(FObra_Param.ME4Filial.Text)));
    if Trim(FObra_Param.ME4Obra.Text) = '' then
      QRMaquinaManu.SetVariable('OBRA',Null)
    else
      QRMaquinaManu.SetVariable('OBRA',StrToInt(Trim(FObra_Param.ME4Obra.Text)));
    if Trim(FObra_Param.Me4DtInicial.Text) <> '' then
      QRMaquinaManu.SetVariable('DT_INICIAL',StrToDate(FObra_Param.Me4DtInicial.Text))
    else
      Raise Exception.Create('Período deve ser Informado');
    if Trim(FObra_Param.Me4DtFinal.Text) = '' then
      FObra_Param.ME4DtFinal.Text := DateToStr(Date);
    QRMaquinaManu.SetVariable('DT_FINAL',StrToDate(FObra_Param.Me4DtFiNAL.Text));

    QRMaquinaManu.Open;
    if FRMaquinaManu = Nil then
      FRMaquinaManu := TFRMaquinaManu.Create(Application);
    FRMaquinaManu.QRLTitulo.Caption := 'Relação de Manutenção de Máquinas De  '+FObra_Param.Me4DtInicial.Text + ' Até ' + FObra_Param.Me4DtFinal.Text;
    FRMaquinaManu.QRLFilial.Caption := 'Filial : '+FObra_Param.Ed4Filial.Text;
    if FObra_Param.RGPreview.ItemIndex = 0 then
       FRMaquinaManu.QRPrimario.Preview
    else
      FRMaquinaManu.QRPrimario.Print;
    QRMaquinaManu.Close;
  end;
end;

procedure TFMaquinaManuCad.RelaodasPrximasManutenes1Click(Sender: TObject);
begin
  inherited;
 if FObra_Param = Nil then
    FObra_Param := TFObra_Param.Create(Application);
  FObra_Param.PGRelatorio.Pages[6].TabVisible := True;
  if FObra_Param.ShowModal = mrOk then
  with DMMaquinaManu do
  begin
    QRMaquinaProxManu.Close;

    if Trim(FObra_Param.ME7Filial.Text) = '' then
      QRMaquinaProxManu.SetVariable('FILIAL',Null)
    else
      QRMaquinaProxManu.SetVariable('FILIAL',StrToInt(Trim(FObra_Param.ME7Filial.Text)));
    if Trim(FObra_Param.ME7Obra.Text) = '' then
      QRMaquinaProxManu.SetVariable('OBRA',Null)
    else
      QRMaquinaProxManu.SetVariable('OBRA',StrToInt(Trim(FObra_Param.ME7Obra.Text)));

    QRMaquinaProxManu.Open;
    if FRMaquinaProxManu = Nil then
      FRMaquinaProxManu := TFRMaquinaProxManu.Create(Application);
    FRMaquinaProxManu.QRLFilial.Caption := 'Filial : '+FObra_Param.Ed7Filial.Text;
    if FObra_Param.RGPreview.ItemIndex = 0 then
       FRMaquinaProxManu.QRPrimario.Preview
    else
      FRMaquinaProxManu.QRPrimario.Print;
    QRMaquinaProxManu.Close;
  end;

end;

end.
