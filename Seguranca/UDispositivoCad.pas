unit UDispositivoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBCtrls;

type
  TFDispositivoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
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
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    RGSituacao: TRadioGroup;
    PorDatadeAcesso1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure PorDatadeAcesso1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDispositivoCad: TFDispositivoCad;

implementation

uses UUsuario_cl, UDispositivoCons, DateUtils, UDispositivoParam, URDispositivoDtAcesso;

{$R *.dfm}

procedure TFDispositivoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMUsuario.QDispositivos.Open;
end;

procedure TFDispositivoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FDispositivoCons = Nil then
    FDispositivoCons := TFDispositivoCons.Create(Application);
  If FDispositivoCons.ShowModal = mrOk then
  With DMUsuario do
  Begin
    QDispositivos.Close;
    QDispositivos.SetVariable('COD_DISPOSITIVO',QDispositivosConsCOD_DISPOSITIVO.Value);
    QDispositivos.Open;
    if QDispositivosIND_SITUACAO.Value = 'A' then
      RGSituacao.ItemIndex := 0;
    if QDispositivosIND_SITUACAO.Value = 'B' then
      RGSituacao.ItemIndex := 1;
    if QDispositivosIND_SITUACAO.Value = 'P' then
      RGSituacao.ItemIndex := 2;
    if QDispositivosDESC_IP_ULTIMO_ACESSO.Value = 'unknown' then
      QDispositivosDESC_IP_ULTIMO_ACESSO.Value := 'NÃO INFORMADO';
  End;
end;

procedure TFDispositivoCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  with DMUsuario do
  begin
    if RGSituacao.ItemIndex = 0 then
      //QDispositivosIND_SITUACAO.Value := 'A';
      DispositivoBloqueado := 'A';
    if RGSituacao.ItemIndex = 1 then
      DispositivoBloqueado := 'B';
    if RGSituacao.ItemIndex = 2 then
      DispositivoBloqueado := 'P';
  end;
end;

procedure TFDispositivoCad.PorDatadeAcesso1Click(Sender: TObject);
var
  wDataIni, wDatafim, wUsuario: string;
begin
  inherited;
  if FDispositivoParam = Nil then
    FDispositivoParam := TFDispositivoParam.Create(Application);
  FDispositivoParam.PGRelatorio.Pages[0].TabVisible := True;
  If FDispositivoParam.ShowModal =  mrOk then
  begin
    wDataIni := '';
    wDatafim := '';
    wUsuario := '';
    with DMUsuario do
    begin
      QRDispovitosDtAcesso.Close;

      if FDispositivoParam.FmDatas1.MeDtInicial.EditText <> '__/__/____' then
      begin
        QRDispovitosDtAcesso.SetVariable('DT_ACESSO_INI',StrToDate(FDispositivoParam.FmDatas1.MeDtInicial.EditText));
        wDataIni := FDispositivoParam.FmDatas1.MeDtInicial.EditText;
      end
      else
      begin
        QRDispovitosDtAcesso.SetVariable('DT_ACESSO_INI', null);
        wDataIni := 'Sem data informada';
      end;

      if FDispositivoParam.FmDatas1.MeDtFinal.EditText <> '__/__/____' then
      begin
        QRDispovitosDtAcesso.SetVariable('DT_ACESSO_FIM',StrToDate(FDispositivoParam.FmDatas1.MeDtFinal.EditText));
        wDatafim := FDispositivoParam.FmDatas1.MeDtFinal.EditText;
      end
      else
        QRDispovitosDtAcesso.SetVariable('DT_ACESSO_FIM', null);

        if Trim(FDispositivoParam.MeUsuario.Text) <> '' then
        begin
          QRDispovitosDtAcesso.SetVariable('COD_USUARIO',Trim(FDispositivoParam.MeUsuario.Text));
          wUsuario := 'Do usuário: ' + Trim(FDispositivoParam.MeUsuario.Text);
        end
        else
        begin
          QRDispovitosDtAcesso.SetVariable('COD_USUARIO', null);
          wUsuario := ' Todos os usuários';
        end;
      QRDispovitosDtAcesso.Open;
      if FRDispositivoDtAcesso = Nil then
        FRDispositivoDtAcesso := TFRDispositivoDtAcesso.Create(Application);
      FRDispositivoDtAcesso.QRLTitulo.Caption := 'Relatório de Dispositivos por Data de Acesso';
      if wDatafim = '' then
        FRDispositivoDtAcesso.QRLabel12.Caption := 'Parâmetros: ' + wUsuario + ', do período: ' + wDataIni
      else
        FRDispositivoDtAcesso.QRLabel12.Caption := 'Parâmetros: ' + wUsuario + ', do período: ' + wDataIni + ' - ' + wDatafim;
      FRDispositivoDtAcesso.QRPrimario.Preview;
    end;
  end;
end;

end.
